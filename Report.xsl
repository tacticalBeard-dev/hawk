<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
xmlns="http://www.w3.org/1999/xhtml">
<xsl:template match="/">
    <html>
        <head>
		<style type="text/css">
		<!-- CSS from https://www.quora.com/How-can-I-expand-and-collapse-a-simple-list-using-just-CSS -->
		ul { list-style-type: none; }
		label{
			background-color: #AAAFAB;
			border-radius: 5px;
			padding: 3px;
			padding-left: 25px;
			color: white;
		}
		li {
			margin: 10px;
			padding: 5px;
			border: 1px solid #ABC;
			border-radius: 5px;
		}
		input[type=checkbox] { display: none; }
		input[type=checkbox] ~ ul {
			max-height: 0;
			max-width: 0;
			opacity: 0;
			overflow: hidden;
			white-space:nowrap;
			-webkit-transition:all .25s ease;
			-moz-transition:all .25s ease;
			-o-transition:all .25s ease;
			transition:all .25s ease;
		}
		input[type=checkbox]:checked ~ ul {
			max-height: 100%;
			max-width: 100%;
			opacity: 1;
		}
		input[type=checkbox] + label:before{ 
			transform-origin:25% 50%;
			border: 8px solid transparent;
			border-width: 8px 12px;
			border-left-color: white;
			margin-left: -20px;
			width: 0;
			height: 0;
			display: inline-block;
			text-align: center;
			content: '';
			color: #AAAFAB;
			-webkit-transition:all .25s ease;
			-moz-transition:all .25s ease;
			-o-transition:all .25s ease;
			transition:all .25s ease;
			position: absolute;
			margin-top: 1px;
		}
		input[type=checkbox]:checked + label:before {
			transform: rotate(90deg);
			/*margin-top: 6px;
			margin-left: -25px;*/
		}
		</style>
		</head>
        <body>
        <title>Hawk Report</title>
		<xsl:for-each select="report/entity">
		<ul>
			<li><input type="checkbox" id="{name}"/> <label for="{name}"><xsl:value-of select="name"/></label>
			<ul>
			<xsl:for-each select="property">
				<li><label style="background-color: {color}"><xsl:value-of select="name"/></label><xsl:value-of select="value"/></li>
			</xsl:for-each>
			</ul>
		</li>
		</ul>
		</xsl:for-each>
		
		</body>
    </html>
</xsl:template>
</xsl:stylesheet>