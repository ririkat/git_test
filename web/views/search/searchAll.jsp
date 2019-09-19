<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ page import="java.util.List, com.jb.pension.model.vo.Pension" %>
<%
	List<Pension> list=(List)request.getAttribute("list");
%>
<%@ include file="/views/common/header.jsp"%>
<section>
	<div class="container">
		<!--리스트컨테이너-->
		<div class="row">
			<!--검색바-->
			<div class="col-md-12">
				<div id="search-container" class="thumbnail">
					<form method="get" action="<%=request.getContextPath()%>/search/pensionFinder">
						<input type="text" name="keyword" placeholder="검색어를 입력하세요"/>
						<input type="text" name="area" placeholder="지역입력"/>
						<select class="selectpicker" data-live-search="true">
						  <option data-tokens="ketchup mustard">Hot Dog, Fries and a Soda</option>
						  <option data-tokens="mustard">Burger, Shake and a Smile</option>
						  <option data-tokens="frosting">Sugar, Spice and all things nice</option>
						</select>
						
						​​​​​​​<input type="submit" value="검색"/>
					</form>
				</div>
			</div>
		</div>
		<div class="row">
			<!--한 행에 들어갈 아이들-->
			<div class="col-sm-12 col-md-12">
				<div class="row">
				<!-- 여기부터 포문 돌려~~ -->
				<%if(list!=null){ 
					for(int i=0; i<list.size(); i++){%>
					<!-- 펜션하나~~ for문 돌려서 알아서 잘 써라잉~~~~-->
					<div class="col-sm-6 col-md-4">
						<div class="thumbnail">
							<img src="<%=request.getContextPath()%>/upload/pension/<%=list.get(i).getPenFile().get(0).getpRenameFile()%>" alt="이미지준비중" style="width:500px; height:300px;">
							<div class="caption">
								<h3><%=list.get(i).getpName() %></h3>
								<p><%=list.get(i).getpAddr() %></p>
								<p>
									<a href="#" class="btn btn-primary" role="button">찜♥</a>
									<a href="<%=request.getContextPath()%>/search/detailView?pCode=<%=list.get(i).getpCode() %>" class="btn btn-default" role="button">예매상세</a>
								</p>
							</div>
						</div>
					</div>
					<!--  -->
				<!-- 여기가 포문 끝~~ -->
				<%}
				}%>
				</div>
			</div>
		</div>
	</div>
</section>
<%@ include file="/views/common/footer.jsp"%>