<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<style>
    #map {
        width:400px;
        height:400px;
        border: 2px solid red;
    }
</style>
<script>
    let marker_detail = {
        init : function () {
            $('#register_btn').click(function () {
                marker_detail.send();
            });
            $('#delete_btn').click(function () {
                let c = confirm("삭제하시겠습니까?")
                if (c == true) {
                    location.href = '/marker/deleteimpl?id='+${marker.id};
                }
            })
        },
        send : function () {
            $('#register_form').attr({
                method:'post',
                action:'/marker/updateimpl',
                enctype: 'multipart/form-data'
            });
            $('#register_form').submit();
        },
    };
    function readImage(input) {
        // 인풋 태그에 파일이 있는 경우
        if(input.files && input.files[0]) {

            // FileReader 인스턴스 생성
            const reader = new FileReader()
            // 이미지가 로드가 된 경우
            reader.onload = e => {
                const previewImage = document.getElementById("preview")
                previewImage.src = e.target.result
            }
            // reader가 이미지 읽도록 하기
            reader.readAsDataURL(input.files[0])
        }
    }
    let marker_detail_map = {
        map : null,
        init: function () {
            let mapContainer = document.querySelector('#map');
            let mapOption = {
                center: new kakao.maps.LatLng(${marker.lat}, ${marker.lng}),
                // 지도의 중심좌표
                level: 3 // 지도의 확대 레벨
            };
            // 마커를 표시할 위치와 title 객체 배열입니다
            // 지도를 표시할 div와  지도 옵션으로  지도를 생성합니다
            map = new kakao.maps.Map(mapContainer, mapOption);
            // 일반 지도와 스카이뷰로 지도 타입을 전환할 수 있는 지도타입 컨트롤을 생성합니다
            var mapTypeControl = new kakao.maps.MapTypeControl();

            // 지도에 컨트롤을 추가해야 지도위에 표시됩니다
            // kakao.maps.ControlPosition은 컨트롤이 표시될 위치를 정의하는데 TOPRIGHT는 오른쪽 위를 의미합니다
            map.addControl(mapTypeControl, kakao.maps.ControlPosition.TOPRIGHT);

            // 지도 확대 축소를 제어할 수 있는  줌 컨트롤을 생성합니다
            var zoomControl = new kakao.maps.ZoomControl();
            // 마커가 표시될 위치입니다
            var markerPosition  = new kakao.maps.LatLng(${marker.lat}, ${marker.lng});

            // 마커를 생성합니다
            var marker = new kakao.maps.Marker({
                position: markerPosition
            });

            // 마커가 지도 위에 표시되도록 설정합니다
            marker.setMap(map);
            map.addControl(zoomControl, kakao.maps.ControlPosition.RIGHT);

            // 마커에 커서가 오버됐을 때 마커 위에 표시할 인포윈도우를 생성합니다
            var iwContent = '<img src="/uimg/${marker.img}" style="width : 100px"><div style="padding:5px;">Hello World!</divdiv>'; // 인포윈도우에 표출될 내용으로 HTML 문자열이나 document element가 가능합니다

            // 인포윈도우를 생성합니다
            var infowindow = new kakao.maps.InfoWindow({
                content : iwContent
            });

            // 마커에 마우스오버 이벤트를 등록합니다
            kakao.maps.event.addListener(marker, 'mouseover', function() {
                // 마커에 마우스오버 이벤트가 발생하면 인포윈도우를 마커위에 표시합니다
                infowindow.open(map, marker);
            });

            // 마커에 마우스아웃 이벤트를 등록합니다
            kakao.maps.event.addListener(marker, 'mouseout', function() {
                // 마커에 마우스아웃 이벤트가 발생하면 인포윈도우를 제거합니다
                infowindow.close();
            });

            kakao.maps.event.addListener(marker, 'click', function() {
                // 마커에 마우스아웃 이벤트가 발생하면 인포윈도우를 제거합니다
                location.href="${gmarker.target}"
            });
        },
    }

    $(function () {
        marker_detail.init();
        marker_detail_map.init();
        $('#imgname').on("change", e => {
            readImage(e.target)
        })
    });
</script>

<!-- Begin Page Content -->
<div class="container-fluid">

    <!-- Page Heading -->
    <h1 class="h3 mb-2 text-gray-800">Marker Detail</h1>
    <p class="mb-4">DataTables is a third party plugin that is used to generate the demo table below.
        For more information about DataTables, please visit the <a target="_blank"
                                                                   href="https://datatables.net">official DataTables documentation</a>.</p>

    <!-- DataTales Form -->
    <div class="card shadow mb-4">
        <div class="card-header py-3">
            <h6 class="m-0 font-weight-bold text-primary">Marker Detail</h6>
        </div>
        <div class="card-body">
            <form id="register_form" class="form-horizontal well">
                <div class="form-group">
                    <div class="col-sm-10">
                        <input type="file" name="imgname" class="form-control" id="imgname" style="display:none" >
                        <a href="javascript:void(0);" onclick="$('#imgname').trigger('click')">
                            <img src="/uimg/${marker.img}" id="preview" style="width:300px; height:300px">
                        </a>
                    </div>
                </div>
                <div class="form-group">
                    <input type="hidden" name="id" value="${marker.id}">
                    <input type="hidden" name="img" value="${marker.img}">
                    <label class="control-label col-sm-2" for="title">TITLE :</label>
                    <div class="col-sm-10">
                        <input type="text" name="title" class="form-control" id="title" value="${marker.title}">
                    </div>
                </div>
                <div class="form-group">
                    <label class="control-label col-sm-2" for="target">TARGET :</label>
                    <div class="col-sm-10">
                        <input type="text" name="target" class="form-control" id="target" value="${marker.target}">
                    </div>
                </div>
                <%-- 이미지 한번에 업로드 할 수 있다.--%>
                <div class="form-group">
                    <label class="control-label col-sm-2" for="lat">LAT :</label>
                    <div class="col-sm-10">
                        <input type="number" name="lat" class="form-control" id="lat" value="${marker.lat}">
                    </div>
                </div>
                <div class="form-group">
                    <label class="control-label col-sm-2" for="lat">LAT :</label>
                    <div class="col-sm-10">
                        <input type="number" name="lng" class="form-control" id="lng" value="${marker.lng}">
                    </div>
                </div>

                <div class="form-group">
                    <label for="loc">Select LOC</label>
                    <select class="form-control" id="loc" name="loc" value="${marker.loc}">
                        <option>S</option>
                        <option>B</option>
                        <option>J</option>
                    </select>
                </div>
                <div class="form-group">
                    <div class="col-sm-offset-2 col-sm-10">
                        <button id="register_btn" type="button" class="btn btn-info">수정</button>
                        <button id="delete_btn" type="button" class="btn btn-info">삭제</button>
                    </div>
                </div>
                <div class="card-body">
                    <div class="row">
                        <div class="col-sm-10" id="map">

                        </div>
                    </div>
                </div>
            </form>
        </div>
    </div>

</div>
<!-- /.container-fluid -->