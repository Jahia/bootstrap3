<%@ page language="java" contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="template" uri="http://www.jahia.org/tags/templateLib" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="jcr" uri="http://www.jahia.org/tags/jcr" %>
<%@ taglib prefix="lang" uri="http://jahia.com/tags/languageswitcher" %>
<%@ taglib prefix="ui" uri="http://www.jahia.org/tags/uiComponentsLib" %>
<%--@elvariable id="currentNode" type="org.jahia.services.content.JCRNodeWrapper"--%>
<%--@elvariable id="out" type="java.io.PrintWriter"--%>
<%--@elvariable id="script" type="org.jahia.services.render.scripting.Script"--%>
<%--@elvariable id="scriptInfo" type="java.lang.String"--%>
<%--@elvariable id="workspace" type="java.lang.String"--%>
<%--@elvariable id="renderContext" type="org.jahia.services.render.RenderContext"--%>
<%--@elvariable id="currentResource" type="org.jahia.services.render.Resource"--%>
<%--@elvariable id="url" type="org.jahia.services.render.URLGenerator"--%>

<jcr:nodeProperty var="image" node="${currentNode}" name="image"/>

<c:if test="${not empty image.node.url}">
    <c:url var="imageUrl" value="${image.node.url}" context="/"/>
</c:if>
<img src="${imageUrl}" alt="${fn:escapeXml(image.node.displayableName)}" <c:if test="${not empty currentResource.moduleParams['maxHeight']}"> style="max-height: ${currentResource.moduleParams['maxHeight']}px; width: 100%;"</c:if> >
<div class="carousel-caption">
    <c:set var="displayTitle" value="true"/>
    <c:if test="${not empty currentNode.properties.displayTitle}">
        <c:set var="displayTitle" value="${currentNode.properties.displayTitle.boolean}"/>
    </c:if>
    <c:if test="${displayTitle}">
        <h3>${currentNode.displayableName}</h3>
    </c:if>
    <c:set var="displayCaption" value="true"/>
    <c:if test="${not empty currentNode.properties.displayCaption}">
        <c:set var="displayCaption" value="${currentNode.properties.displayCaption.boolean}"/>
    </c:if>
    <c:if test="${displayCaption}">
        <p>${currentNode.properties.caption.string}</p>
    </c:if>
</div>




