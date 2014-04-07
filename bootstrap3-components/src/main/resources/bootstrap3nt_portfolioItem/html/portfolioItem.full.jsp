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

<jcr:nodeProperty node="${currentNode}" name="picture" var="portfolioImage"/>
<jcr:nodeProperty node="${currentNode}" name="photos" var="photos"/>
<c:url value="${url.files}${portfolioImage.node.path}" var="portfolioImageUrl"/>

<div class="row portfolio-item margin-bottom-50">
  <div class="col-md-7">
    <template:module node="${photos}" view="photos"/> 
    <c:if test="${renderContext.editMode}">
    <template:module path="photos"/>
</c:if>
  </div>
  <div class="col-md-5">
    <h2>${currentNode.properties['informationTitle'].string}</h2>
    ${currentNode.properties['information'].string}
  </div>
</div>