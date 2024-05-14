<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<HTML><HEAD><TITLE>Redirigiendo a ...</TITLE>
<META http-equiv=Content-Type content="text/html; charset=iso-8859-1">
<LINK href="misc/style.css" rel=stylesheet>

<%@ page language="java" import="java.lang.*,java.util.*,java.io.*" %>

<%!
static String urlRedirect = null;

static {
	String vls_pathProp = "/etc/app/conf/crc/redirect/local.redirect.properties";
	Properties props = new Properties();
	try {
		props.load(new FileInputStream(vls_pathProp));
	} catch (IOException e) {
		e.printStackTrace();
	}
	;
	urlRedirect = props.getProperty("redirect.url");
}

%>

</HEAD>
	<body>
	<%
		String error = "";
		String errorCodeParam = "p_error_code";

		// ================= CARGA DE IDIOMAS =================
		ResourceBundle bundle;
		String idioma = request.getParameter("lang");
		if ( idioma == null || idioma.isEmpty() ) {
			// cargar cas por defecto
			idioma = "cas";
			bundle = ResourceBundle.getBundle("idioma_cas", new Locale("es_ES"));
		} else if ( !"cas".equals(idioma) && !"val".equals(idioma) ) {
			// cargar cas si pasan un valor incorrecto por url
			idioma = "cas";
			bundle = ResourceBundle.getBundle("idioma_cas", new Locale("es_ES"));
		} else {
			// cargar idioma
			String locStr;
			if ("cas".equals(idioma)) {
				locStr = "es_ES";
			} else {
				locStr = "ca_ES";
			}
			Locale locale = new Locale(locStr);
			bundle = ResourceBundle.getBundle("idioma_" + idioma, locale);
		}

	%>
	    <div id="contenedor" class="contenedor">
			<div id="body" class="body">
					<p> <%= bundle.getString("redirigiendoa") %> <%= urlRedirect %></p>
			</div>
	</body>
</HTML>
