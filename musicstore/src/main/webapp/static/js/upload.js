$(document).ready(function () {
    $("#file").change(function () {
        var listValidFileType = ["image/jpg", "image/jpeg", "image/gif", "image/png"];
        var fileList = this.files;
        var count = 0;
        $(".preview-image").empty();
        for (var index = 0; index < fileList.length; index++) {
            if (listValidFileType.indexOf(this.files[0].type) == -1) {
                count++;
            } 
        }
        if (count != 0) {
            alert("Please choose only image files!")
            $("#file").replaceWith($("#file").val('').clone(true));
        }
        else {
            readURL(this);
        }
    });

    function readURL(input) {
        $(".preview-image").show();
        if (input.files && input.files[0]) {
            for (var index = 0; index < input.files.length; index++) {
                var reader = new FileReader();
                reader.onload = function (e) {
                    if ($(".preview-image")[0]) {
                        $(".preview-image").append(
                            "<div style='float:left;padding-right:10px;padding-bottom:10px;'>" +
                            "<img src= '" + e.target.result + "' id= 'imageUpload' width= '100px' height= '75px'/>" +
                            "</div>"
                        );
                    } else {
                        $('#imageUpload').attr('src', e.target.result);
                        $('#imageUpload').show();
                    }
                }
                reader.readAsDataURL(input.files[index]);
            }
        }
        else {
            $('#imageUpload').hide();
        }
    }
});

$(document).ready(function() {
	$('#form').submit(function() {
		var title = $.trim($('#title').val());
		var price = $.trim($('#price').val());

		if (title == '' && price=='') {
			$('#title_error').text('Title empty');
			$('#price_error').text('Price empty!');
			return false;
		} else {
			$('#title_error').text('');
			$('#price_error').text('');
		}
		if (title == '') {
			$('#title_error').text('Title empty');
			return false;
		} else {
			$('#title_error').text('');
		}
		if (price == '') {
			$('#price_error').text('Price empty');
			return false;
		} else {
			$('#price_error').text('');
		}
		// Code validate form

		if (price.length < 0) {
			$('#price_error').text('Price empty!');
			return false;
		} else {
			$('#price_error').text('');
		}

	});
});