<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:template match="/">

    <html>
        <head>
            <style>
                #itr_row {
                    background-color: #DBF2E8
                }
                .main_elements {
                    background-color: #ADF3C4
                }
                td, th {
                    padding: 3px;
                    text-align: center
                }
            </style>
        </head>
        <body>
            <h2>Результаты работы программы:</h2>
            <table>
                <tr class = 'main_elements'>
                    <th rowspan = "2" style = "border-bottom: 2px solid black"> Введённые данные </th>
                    <td> Число 1  </td>
                    <td> Число 2 </td>
                </tr>
                <tr class = 'main_elements'>
                    <td style = "border-bottom: 2px solid black">
                        <xsl:value-of select="objects/object[1]"/>
                    </td>
                    <td style = "border-bottom: 2px solid black">
                        <xsl:value-of select="objects/object[2]"/>
                    </td>
                </tr>
                <tr>
                    <th colspan = "2"> Нахождение наибольшего общего делителя алгоритмом Евклида </th>
                </tr>
                <tr>
                    <td> Число 1 </td>
                    <td> Число 2 </td>
                </tr>
                <xsl:for-each select="objects/object[@type = 'array']/object">
                    <tr id='itr_row'>
                        <td> <xsl:value-of select="object[1]"/> </td>
                        <td> <xsl:value-of select="object[2]"/> </td>
                    </tr>
                </xsl:for-each>
                <tr>
                    <td style = "text-align: right; border-top: 2px solid black"> Наибольший общий делитель: </td>
                    <th style = "border-top: 2px solid black">
                        <xsl:value-of select="objects/object[3]"/>
                    </th>
                </tr>
                <tr>
                    <td style = "text-align: right"> Наименьшее общее кратное: </td>
                    <th>
                        <xsl:value-of select="objects/object[4]"/>
                    </th>
                </tr>
            </table>
        </body>
    </html>

</xsl:template>
</xsl:stylesheet>