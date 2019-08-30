<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/views/common/header.jsp" %>

 <div class="container-fluid">
        <div class="row content">
            <div class="col-sm-3 sidenav">
                <br>
                <br>
                <h4 id="mypagetitle"><a href="mypage.html">&nbsp;&nbsp;마이페이지</a></h4>
                <div id="mypageList">
                    <ul class="nav nav-pills nav-stacked">
                        <br>
                        <li><a href="mypage.html">&nbsp;&nbsp;예약확인/취소</a></li>
                        <li class="active"><a href="jjim.html">&nbsp;&nbsp;내가찜한객실</a></li>
                        <li><a href="updateUserInfo.html">&nbsp;&nbsp;회원정보수정</a></li>
                        <li><a href="DeleteUserInfo.html">&nbsp;&nbsp;회원탈퇴</a></li>
                    </ul><br>
                </div>

            </div>

            <!-- 마이페이지 nav끝 -->


            <!-- 내가 찜한 객실 시작 -->

            <section>
                <br> <br> <br>
                <h4 id="jjimtitle"><small>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;내가 찜한 객실</small></h4>
                <hr>

                <!-- 찜한객실 이미지 -->

                <div class="row">
                    <div class="col-md-4">
                        <div class="thumbnail">
                            <a href="#">
                                <img src="images/mypage.jpg" width="200px" height="200px">
                                <div class="caption">
                                    <p class="text-center"><strong>리리펜션</strong></p>
                                    <p class="text-center">경기도 화성시 소재</p>
                                    <button type="button" class="btn btn-warning" id="deletejjim"
                                        onclick="deleteJjim();">좋아요 취소</button>
                                    <!-- <h5><span class="label label-success">좋아요 취소</span></h5><br> -->
                                </div>
                            </a>
                        </div>
                    </div>
                    <div class="col-md-4">
                        <div class="thumbnail">
                            <a href="#">
                                <img src="<%=request.getContextPath()%>/web/images/mypage.jpg" width="200px" height="200px">
                                <div class="caption">
                                    <p class="text-center"><strong>허니펜션</strong></p>
                                    <p class="text-center">경기도 화성시 소재</p>
                                    <button type="button" class="btn btn-warning" id="deletejjim"
                                        onclick="deleteJjim();">좋아요 취소</button>
                                    <!-- <h5><span class="label label-success ">좋아요 취소</span></h5><br> -->
                                </div>
                            </a>
                        </div>
                    </div>
                    <div class="col-md-4">
                            <div class="thumbnail">
                                <a href="#">
                                    <img src="images/mypage.jpg" width="200px" height="200px">
                                    <div class="caption">
                                        <p class="text-center"><strong>워니펜션</strong></p>
                                        <p class="text-center">경기도 용인시 소재</p>
                                        <button type="button" class="btn btn-warning" id="deletejjim"
                                            onclick="deleteJjim();">좋아요 취소</button>
                                        <!-- <h5><span class="label label-success ">좋아요 취소</span></h5><br> -->
                                    </div>
                                </a>
                            </div>
                        </div>
                    <div class="col-md-4">
                        <div class="thumbnail">
                            <a href="#">
                                <img src="images/mypage.jpg" width="200px" height="200px">
                                <div class="caption">
                                    <p class="text-center"><strong>선덕여왕펜션</strong></p>
                                    <p class="text-center">경기도 오산시 소재</p>
                                    <button type="button" class="btn btn-warning" id="deletejjim"
                                        onclick="deleteJjim();">좋아요 취소</button>
                                    <!-- <h5><span class="label label-success">좋아요 취소</span></h5><br> -->

                                </div>
                            </a>
                        </div>
                    </div>
                </div>
        </div>
    </div>
    </div>

    </section>

<%@ include file="/views/common/footer.jsp" %>








