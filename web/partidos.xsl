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
			<img src="{./@logotipo}" alt="Reservas" />
			<a href="tienda.xml">Tienda</a>
			<a href="equipos.xml">Equipos</a>
			<a href="partidos.xml">Partidos</a>
		</header>
		
		<main>
		<h1>PARTIDOS</h1>
		<table>
			<tr>
				<th>PARTIDO</th>
				<th>FECHA</th>
				<th>RESULTADO</th>
			</tr>
			
			<xsl:for-each select="partido/lugar[@ciudad = 'Lima']/..">
				<xsl:sort select="fecha" order="descending"/>
				<tr>
					<td><xsl:value-of select="concat(equipos/local, ' - ', equipos/visitante)"/></td>
					<td><xsl:value-of select="fecha"/></td>

					<xsl:variable name="puntosLocal" select="equipos/local/@puntuacion"/>
					<xsl:variable name="puntosVisitante" select="equipos/visitante/@puntuacion"/>
					<xsl:if test="$puntosLocal > $puntosVisitante">
						<td><xsl:value-of select="concat($puntosLocal, ' - ', $puntosVisitante)"/></td>
					</xsl:if>
					<xsl:if test="$puntosVisitante > $puntosLocal">
						<td class="azul"><xsl:value-of select="concat($puntosLocal, ' - ', $puntosVisitante)"/></td>
					</xsl:if>
				</tr>
			</xsl:for-each>
			
		</table>			
		</main>
		<footer>
			<address>&#169; Desarrollado por info@birt.eus</address>
		</footer>
	</body>
</html>

</xsl:template>
    
</xsl:stylesheet>