$(document)
		.ready(
				function() {
					$('#form')
							.submit(
									function() {
										var username = $.trim($('#username')
												.val());
										var email = $.trim($('#email').val());
										var password = $.trim($('#password')
												.val());
										var confirmpassword = $.trim($(
												'#confirmpassword').val());

										if (username == '' && email == ''
												&& password == ''
												&& confirmpassword == '') {
											$('#username_error').text(
													'Please enter username !');
											$('#email_error').text(
													'Please enter email !');
											$('#password_error').text(
													'Please enter password !');
											$('#confirm_error').text(
													'Please Confirm Password !');
											return false;
										}
										if (username == '') {
											$('#username_error').text(
													'Please enter username !');
											return false;
										} else {
											$('#username_error').text('');
										}
										if (email == '') {
											$('#email_error').text(
													'Please enter email !');
											return false;
										} else {
											$('#email_error').text('');
										}
										if (password == '') {
											$('#password_error').text(
													'Please enter password !');
											return false;
										} else {
											$('#password_error').text('');
										}
										if (confirmpassword == '') {
											$('#confirmpassword_error').text(
													'Please Confirm Password !');
											return false;
										} else {
											$('#confirmpassword').text('');
										}
										// Code validate form

										if (password != confirmpassword) {
											$('#confirmpassword_error')
													.text(
															'Password and confirm password not same !!');
											return false;
										} else {
											$('#confirmpassword_error')
													.text('');
										}

									});
				});