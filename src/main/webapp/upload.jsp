<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<body>
 <img id="image"src=""/>
<br/>
 <input type="file"onchange="selectImage(this);"/>
<br/>
 <input type="button"onclick="uploadImage();"value="提交"/>
<script>
 var image = '';
 function selectImage(file)
 {
 	if(!file.files || !file.files[0]){
		return;
		}
	 var reader = new FileReader();
	 reader.onload = function(evt){
	 document.getElementById('image').src = evt.target.result;
	 image = evt.target.result;
		}
	reader.readAsDataURL(file.files[0]);
}
 function uploadImage(){

$.ajax({

type:'POST',

 url: 'http://localhost:8080/zblog/backend/uploads/js-upload', 

 data: {image: image},

 async: false,

 dataType: 'json',

 success: function(data){

if(data.code == 0 ){

alert('上传成功');

}else{

alert('上传失败');

}

},

 error: function(err){

alert('网络故障');

}

});

}
</script>
 <script src="resource/js/jquery-1.9.1.min.js"></script>
</body>
</html>