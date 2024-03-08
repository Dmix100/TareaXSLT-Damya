<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0">

<xsl:output encoding="UTF-8" method="html" doctype-system="about:legacy-compat"/>

<xsl:template match="/club_voleibol">

<html lang="es">

	<head>
		<link href="../css/estilo.css" rel="stylesheet" type="text/css" />
		<meta charset="utf-8"/>
		<meta name="description" content="Página principal" />
		<title><xsl:value-of select="titulo"/></title>
	</head>

	<body>
		<header>
			<img src="{./@logotipo}" alt="Reservas"/>
			<a href="tienda.xml">Tienda</a>
			<a href="equipos.xml">Equipos</a>
			<a href="partidos.xml">Partidos</a>
		</header>
		
		<main>
			<xsl:variable name="entrenador" select="'Julio Velasco'"/>
			<xsl:apply-templates select="equipo/entrenador[nombre=$entrenador]/.."/>
		</main>

		<footer>
			<address>&#169; Desarrollado por info@birt.eus</address>
		</footer>
	</body>
</html>

</xsl:template>

<xsl:template match="equipo">
	<h1><a href="{entrenador/url}"><xsl:value-of select="entrenador/nombre"/></a></h1>
	<article class="equipos">
		<h4><xsl:value-of select="nombre"/></h4>
		<xsl:apply-templates select="jugadores/jugador[@titular='si']"/>
	</article>
</xsl:template>

<xsl:template match="jugador">
	<p><xsl:value-of select="concat(@camiseta, ' - ', nombre)"/></p>
</xsl:template>
    
</xsl:stylesheet>