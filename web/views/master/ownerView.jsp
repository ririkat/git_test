<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.jb.owner.model.vo.Owner"%>
<%
	Owner o = (Owner)request.getAttribute("owner");
%>
<!-- 헤더 끝 -->

<%@ include file="/views/common/header.jsp"%>
<%@ include file="/views/common/sideMaster.jsp"%>

<div class="col-md-10">
    <div class="mContent">
		<br><br><br>

		 <center><p class="title" style="color: #6a60a9;">업주정보</p></center>
		<br><br><br>
		<section id="enroll-container">
			<form name="form1" method="post">
				<table class="updateTable">
					<colgroup>
						<col width="160px">
						<col width="">
					</colgroup>
					<tbody>
						<tr>
							<th class="point" style="vertical-align: middle"><strong
								class="point">*</strong>이름</th>
							<td><%=o.getoName() %><input type="hidden" name="uid" value=""></td>
						</tr>
						
						<tr>
							<th class="point"><strong class="point">*</strong>아이디</th>
							<td><%=o.getoId() %></td>
						</tr>
						
						<tr>
							<th class="point"><strong class="point"></strong>생년월일</th>
		
							<td><input type="date" value="<%=o.getoBirth() %>"
								class="input_real datepicker2 hasDatepicker" readonly></td>
						</tr>
		
						<tr>
							<th class="point"><strong class="point">*</strong>성별</th>
							<%if(o.getoGender().charAt(0)=='M'){ %>
							<td><input type="radio" name="usex" value="M" checked>남
								&nbsp; <input type="radio" name="usex" value="F">여</td>
							<%}else{ %>
							<td><input type="radio" name="usex" value="M">남 &nbsp;
								<input type="radio" name="usex" value="F" checked>여</td>
							<%} %>
						</tr>
		
						
		
						<tr>
							<th class="point"><strong class="point">*</strong>이메일</th>
							<td><input type="text" name="uemail01"
								style="IME-MODE: disabled"
								value="<%=o.getoEmail().substring(0,o.getoEmail().indexOf("@")) %>"
								readonly> @ <input type="text" name="uemail02"
								id="uemail02" style="IME-MODE: disabled"
								value="<%=o.getoEmail().substring(o.getoEmail().indexOf("@")+1)%>"
								readonly> </td>
						</tr>
		
						<tr>
							<th class="point"><strong class="point">*</strong>핸드폰번호</th>
							<td><input type="text" name="phone" id="phone" class="w50px"
								value="<%=o.getoPhone()%>"> <!--                                     <input type="text" name="hp2" id="hp2" class="w50px" maxlength="4" onkeyup="FocusNext('hp2','hp3',4)" style="IME-MODE: disabled" value="9376"> -->
								<!--                                     <input type="text" name="hp3" id="hp3" class="w50px" maxlength="4" style="IME-MODE: disabled" value="8120"> -->
							</td>
						</tr>
		
						<tr>
							<th class="point">주소</th>
							<td>
								<%--<input type="text" name="cAddr" id="cAddr" value="<%=loginClient.getcAddr()%>" required> --%>
								<%-- 							<%System.out.println("테스트: "+ o.getoAddr().substring(o.getoAddr().indexOf("^")+1 ,o.getoAddr().indexOf("|")) ); %> --%>
								<input id="zonecode" name="zonecode" type="text"
								value="<%=o.getoAddr().substring(o.getoAddr().indexOf("우")+2, o.getoAddr().indexOf("|"))%>"
								style="width: 70px;" readonly /> &nbsp;  <br /> <input type="text" id="address"
								name="address"
								value="<%=o.getoAddr().substring(o.getoAddr().indexOf("|")+1 ,o.getoAddr().lastIndexOf("|"))%>"
								style="width: 240px;" required readonly /> <input type="text"
								placeholder="상세주소입력" name="address_etc" id="address_etc"
								value="<%=o.getoAddr().substring(o.getoAddr().lastIndexOf("|")+1)%>"
								style="width: 200px;" />
							</td>
						</tr>
					</tbody>
				</table>
			</form>
			
			<br><br>
			<div class="button">
				<input type="button" onclick="deleteOwner();" value="삭제">
				<input type="reset" onclick="location.href='<%=request.getContextPath()%>/master/ownerList'" value="취소">
			</div>
		</section>
	</div>
</div>

<script>
	function deleteOwner(){
		if(confirm('정말로 삭제하시겠습니까?')){
			location.href='<%=request.getContextPath()%>/master/ownerDelete?oId=<%=o.getoId()%>';
		}
	}
</script>

<%@ include file="/views/common/footer.jsp"%>