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
<c:set var="picturePosition" value="${currentNode.properties['picturePosition'].string}"/>
<c:choose>
  <c:when test="${picturePosition == 'left'}">
    <c:set var="pictureClass" value=" pull-left lft-img-margin"/>
  </c:when>
  <c:when test="${picturePosition == 'right'}">
    <c:set var="pictureClass" value=" pull-right rgt-img-margin"/>
  </c:when>
</c:choose>
    
    
  <jcr:nodeProperty node="${currentNode}" name="picture" var="picture"/>
  <c:url value="${url.files}${picture.node.path}" var="pictureUrl"/>
  
  <div class="tab-pane ${first or renderContext.editMode ? ' active' : ''}" id="${currentNode.properties['tabname'].string}">
    <img alt="" class="${pictureClass} img-width-200" src="${pictureUrl}">                         
    <h4>${currentNode.properties['jcr:title'].string}</h4>
    <p>${currentNode.properties['description'].string}</p>
  </div>