<%@ page language="java" contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="template" uri="http://www.jahia.org/tags/templateLib" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="jcr" uri="http://www.jahia.org/tags/jcr" %>
<%@ taglib prefix="lang" uri="http://jahia.com/tags/languageswitcher" %>

<%--@elvariable id="currentNode" type="org.jahia.services.content.JCRNodeWrapper"--%>
<%--@elvariable id="out" type="java.io.PrintWriter"--%>
<%--@elvariable id="script" type="org.jahia.services.render.scripting.Script"--%>
<%--@elvariable id="scriptInfo" type="java.lang.String"--%>
<%--@elvariable id="workspace" type="java.lang.String"--%>
<%--@elvariable id="renderContext" type="org.jahia.services.render.RenderContext"--%>
<%--@elvariable id="currentResource" type="org.jahia.services.render.Resource"--%>
<%--@elvariable id="url" type="org.jahia.services.render.URLGenerator"--%>
<%--TODO --%>
<ul class="loginbar pull-right">
    <ui:initLangBarAttributes activeLanguagesOnly="${renderContext.liveMode}"/>
    <c:set var="languageCodes" value="${requestScope.languageCodes}"/>
    <c:if test="${fn:length(languageCodes)>1}">
        <li>
            <i class="icon-globe"></i>
            <a>Languages</a><%-- TODO: hardcoded --%>
            <ul class="lenguages">
                <%--
                <c:forEach var="languageCode" items="${languageCodes}">
                    <lang:switchToLanguageLink languageCode="${languageCode}" activeCSS="icon-ok" defaultCSS=""/>
                </c:forEach>
                --%>
                <li class="active">
                    <a href="#">English <i class="icon-ok"></i></a>
                </li>
                <li><a href="#">Spanish</a></li>
                <li><a href="#">Russian</a></li>
                <li><a href="#">German</a></li>
            </ul>
        </li>
    </c:if>


    <li class="devider"></li>
    <li><a href="page_faq.html">Help</a></li>
    <li class="devider"></li>
    <li><a href="page_login.html">Login</a></li>
</ul>