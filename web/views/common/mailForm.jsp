<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/views/common/header.jsp"%>
<section>
<div id="mail-container">
	<form action="SendMail.jsp" method="post">
		<table>
			<tr>
				<th colspan="2"><div class="tit_contents">JSP메일보내기</div></th>
			</tr>
			<tr>
				<td>from</td><td><input type="text" name="from"></td>
			</tr>
			<tr>
				<td>to</td><td><input type="text" name="to"></td>
			</tr>
			<tr>
				<td>subject</td><td><input type="text" name="subject"></td>
			</tr>
			<tr>
				<td>content</td><td><textarea name="content" id="content" style="width:170px; height:200px;"></textarea></td>
			</tr>
			<tr>
				<td colspan="2" style="text-align: right;"><input type="submit" value="Transmission"></td>
			</tr>
		</table>
	</form>
</div>
</section>
<%@ include file="/views/common/footer.jsp"%>