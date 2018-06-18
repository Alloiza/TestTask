<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib prefix="from" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page session="false" %>
<html>
<head>
  <title>Book List</title>

  <style type="text/css">
    .tg {
      border-collapse: collapse;
      border-spacing: 0;
      border-color: #ccc;
    }

    .tg td {
      font-family: Arial, sans-serif;
      font-size: 14px;
      padding: 10px 5px;
      border-style: solid;
      border-width: 1px;
      overflow: hidden;
      word-break: normal;
      border-color: #ccc;
      color: #333;
      background-color: #fff;
    }

    .tg th {
      font-family: Arial, sans-serif;
      font-size: 14px;
      font-weight: normal;
      padding: 10px 5px;
      border-style: solid;
      border-width: 1px;
      overflow: hidden;
      word-break: normal;
      border-color: #ccc;
      color: #333;
      background-color: #f0f0f0;
    }
    </style>
</head>
<body>

<br/>

<h1>Book List</h1>

<c:url var="searchAction" value="/search"/>
<form:form action="${searchAction}" commandName="book">
  <td>
    <h2>Search by title</h2>

    <input type="text" name="searchTitle" id="searchTitle"/>

    <input type="submit"
           value="<spring:message text="Search"/>"/>
  </td>
</form:form>

<br/>

<c:if test="${!empty listBooks}">
  <table class="tg">
    <tr>
      <th width="80">ID</th>
      <th width="120">Title</th>
      <th width="120">Description</th>
      <th width="120">Author</th>
      <th width="120">ISBN</th>
      <th width="120">PrintYear</th>
      <th width="60">ReadAlready</th>
      <th width="60">Update</th>
      <th width="60">MakeRead</th>
      <th width="60">Delete</th>
    </tr>
    <c:forEach items="${listBooks}" var="book">
      <tr>
        <td>${book.id}</td>
        <td><a href="/read/${book.id}">${book.title}</a></td>
        <td>${book.description}</td>
        <td>${book.author}</td>
        <td>${book.isbn}</td>
        <td>${book.printYear}</td>
        <td>${book.readAlready}</td>
        <td><a href="<c:url value='/update/${book.id}'/>">Update</a></td>
        <td><a href="<c:url value='/makeRead/${book.id}'/>">MakeRead</a></td>
        <td><a href="<c:url value='/delete/${book.id}'/>">Delete</a></td>
      </tr>
    </c:forEach>
  </table>
</c:if>

<h2>Create a Book</h2>

<c:url var="createAction" value="/books/create"/>

<form:form action="${createAction}" commandName="book">
  <table>
    <tr>
        <td>
          <form:label path="id">
            <spring:message text="ID"/>
          </form:label>
        </td>
        <td>
          <form:input path="id" readonly="true" size="8" disabled="true"/>
          <form:hidden path="id"/>
        </td>
      </tr>
    <tr>
      <td>
        <form:label path="title">
          <spring:message text="Title"/>
        </form:label>
      </td>
      <td>
        <form:input path="title"/>
      </td>
    </tr>
    <tr>
      <td>
        <form:label path="description">
          <spring:message text="Description"/>
        </form:label>
      </td>
      <td>
        <form:input path="description"/>
      </td>
    </tr>
    <tr>
      <td>
        <form:label path="author">
          <spring:message text="Author"/>
        </form:label>
      </td>
      <td>
        <form:input path="author"/>
      </td>
    </tr>
    <tr>
      <td>
        <form:label path="isbn">
          <spring:message text="ISBN"/>
        </form:label>
      </td>
      <td>
        <form:input path="isbn"/>
      </td>
    </tr>
    <tr>
      <td>
        <form:label path="printYear">
          <spring:message text="PrintYear"/>
        </form:label>
      </td>
      <td>
        <form:input path="printYear"/>
      </td>
    </tr>
    <tr>
      <td>
        <input type="submit"
               value="<spring:message text="Create Book"/>"/>
      </td>
    </tr>
  </table>
</form:form>

<c:url value="${currentsort}" var="prev">
  <c:param name="page" value="${page-1}"/>
</c:url>
<c:if test="${page > 1}">
  <a href="<c:out value="${prev}" />" class="pn prev">
    <button class="btn btn-info">Previous</button></a>
</c:if>

<c:forEach begin="1" end="${maxPages}" step="1" varStatus="i">
  <c:choose>
    <c:when test="${page == i.index}">
      <span>${i.index}</span>
    </c:when>
    <c:otherwise>
      <c:url value="${currentsort}" var="url">
        <c:param name="page" value="${i.index}"/>
      </c:url>
      <a href='<c:out value="${url}" />'><button class="btn btn-info">${i.index}</button></a>
    </c:otherwise>
  </c:choose>
</c:forEach>
<c:url value="${currentsort}" var="next">
  <c:param name="page" value="${page + 1}"/>
</c:url>
<c:if test="${page + 1 <= maxPages}">
  <a href='<c:out value="${next}" />' class="pn next">
    <button class="btn btn-info">Next</button></a>
</c:if>

</body>
</html>
