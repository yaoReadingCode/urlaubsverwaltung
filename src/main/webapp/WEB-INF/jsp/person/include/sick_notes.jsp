<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@taglib prefix="joda" uri="http://www.joda.org/joda/time/tags" %>

<div class="overview-header">

    <legend id="sickNotes">
        <p>
            <spring:message code="sicknotes" />
        </p>
    </legend>

</div>

<c:choose>

    <c:when test="${empty sickNotes}">
        <spring:message code="sicknotes.none" />
    </c:when>

    <c:otherwise>
        <table class="app-tbl centered-tbl sortable-tbl tablesorter zebra-table" cellspacing="0">
            <thead>
            <tr>
                <th><spring:message code="sicknotes.time" /></th>
                <th><spring:message code="work.days" /></th>
                <th><spring:message code="sicknotes.aub.short" /></th>
                <th class="print-invisible"><spring:message code="app.date.overview" /></th>
            </tr>
            </thead>
            <tbody>
            <c:forEach items="${sickNotes}" var="sickNote" varStatus="loopStatus">
                <c:choose>
                    <c:when test="${sickNote.active}">
                        <c:set var="CSS_CLASS" value="active" />
                    </c:when>
                    <c:otherwise>
                        <c:set var="CSS_CLASS" value="inactive" />
                    </c:otherwise>
                </c:choose>
                <tr class="${CSS_CLASS}" onclick="navigate('${formUrlPrefix}/sicknote/${sickNote.id}');">
                    <td>
                        <joda:format style="M-" value="${sickNote.startDate}"/>&nbsp;-&nbsp;<joda:format style="M-" value="${sickNote.endDate}"/>
                    </td>
                    <td>
                        <fmt:formatNumber maxFractionDigits="1" value="${sickNote.workDays}" />
                    </td>
                    <td>
                        <joda:format style="M-" value="${sickNote.aubStartDate}"/>&nbsp;-&nbsp;<joda:format style="M-" value="${sickNote.aubEndDate}"/>
                    </td>
                    <td class="print-invisible">
                        <joda:format style="M-" value="${sickNote.lastEdited}"/>
                    </td>
            </c:forEach>
            </tbody>
        </table>
    </c:otherwise>

</c:choose>