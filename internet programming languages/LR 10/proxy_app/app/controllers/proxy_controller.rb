# frozen_string_literal: true

require 'open-uri'
require 'nokogiri'

# Class for ProxyController
class ProxyController < ApplicationController
  before_action :validates, only: :show
  before_action :parse_params, only: :show
  before_action :prepare_url, only: :show

  def input; end

  def show
    answer = URI.open(@url)
    case @mode
    when 'server'
      @result = xslt_server_transform(answer)
    when 'client'
      render xml: xslt_client_transform(answer).to_xml
    else
      render xml: answer
    end
  end

  private

  BASE_API_URL = 'http://localhost:3000/?format=xml'
  XSLT_SERVER_TRANSFORM = "#{Rails.root}/public/server_transform.xslt".freeze

  def validates
    number1 = params[:number1]
    number2 = params[:number2]
    return if number1&.match(/-?[1-9]+/) && number2&.match(/-?[1-9]+/)

    flash[:alert] = '- поле не должно быть пустым или содержать 0'
    redirect_to root_path
  end

  def parse_params
    @num1 = params[:number1]
    @num2 = params[:number2]
    @mode = params[:mode]
  end

  def prepare_url
    @url = BASE_API_URL + "&number1=#{@num1}&number2=#{@num2}"
  end

  def xslt_server_transform(data)
    doc = Nokogiri::XML(data)
    xslt = Nokogiri::XSLT(File.read(XSLT_SERVER_TRANSFORM))
    xslt.transform(doc)
  end

  def xslt_client_transform(data)
    doc = Nokogiri::XML(data)
    xslt = Nokogiri::XML::ProcessingInstruction.new(doc,
                                                    'xml-stylesheet',
                                                    'type="text/xsl" href="/browser_transform.xslt"')
    doc.root.add_previous_sibling(xslt)
    doc
  end
end
