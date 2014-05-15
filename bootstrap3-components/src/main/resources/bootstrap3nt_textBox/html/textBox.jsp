<%@ page language="java" contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="template" uri="http://www.jahia.org/tags/templateLib" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="jcr" uri="http://www.jahia.org/tags/jcr" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%--@elvariable id="currentNode" type="org.jahia.services.content.JCRNodeWrapper"--%>
<%--@elvariable id="out" type="java.io.PrintWriter"--%>
<%--@elvariable id="script" type="org.jahia.services.render.scripting.Script"--%>
<%--@elvariable id="scriptInfo" type="java.lang.String"--%>
<%--@elvariable id="workspace" type="java.lang.String"--%>
<%--@elvariable id="renderContext" type="org.jahia.services.render.RenderContext"--%>
<%--@elvariable id="currentResource" type="org.jahia.services.render.Resource"--%>
<%--@elvariable id="url" type="org.jahia.services.render.URLGenerator"--%>

<div class="who margin-bottom-30">
    <c:set var="title" value="${currentNode.properties['jcr:title'].string}"/>
    <c:set var="hx" value="${currentNode.properties['hx'].string}"/>
    <c:set var="secondaryTitle" value="${currentNode.properties['secondaryTitle'].string}"/>
    <c:if test="${! empty secondaryTitle}">

    </c:if>

    <c:if test="${empty hx}">
        <c:set var="hx" value="h2"/>
    </c:if>
    <c:if test="${! empty title}">
        <div class="headline">
            <${hx}>${title}<c:if test="${! empty secondaryTitle}"> <small>${secondaryTitle}</small></c:if></${hx}>
        </div>
    </c:if>
    ${currentNode.properties['text'].string}
</div>