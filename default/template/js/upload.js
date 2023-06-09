// begin upload.js

function FileReaderCallback (event) { // sets image to visible once ready
	//alert('debug: FileReaderCallback()');
	if (document.getElementById) {
		var imgImagePreview = document.getElementById('imgImagePreview');
		if (imgImagePreview) {
			imgImagePreview.style.display = 'inline';
			imgImagePreview.setAttribute('src', event.target.result);
		}
	}
} // FileReaderCallback()

function UploadedFileOnChange (t) { // t=this; called when file selector is changed
	//alert('debug: UploadedFileOnChange()');
	if (t && window.FileReader && document.getElementById) {
		var reader = new FileReader();
		reader.onload = window.FileReaderCallback;

		if (t.files && t.files[0]) {
			reader.readAsDataURL(t.files[0]);
		}

		var submit = document.getElementById('submit');
		if (submit && submit.style) {
			//submit.setAttribute('value', 'Upload');
			submit.style.border = "5pt solid orange";
		}
	}
} // UploadedFileOnChange()

function UploadAddImagePreviewElement () { // add image preview element, hidden until needed
	if (document.getElementById && document.createElement) {
		var spanImagePreview = document.getElementById('spanImagePreview');
		if (spanImagePreview) {
			var imgImagePreview = document.createElement('img');
			imgImagePreview.setAttribute('src', '');
			imgImagePreview.setAttribute('id', 'imgImagePreview');
			imgImagePreview.setAttribute('alt', 'Preview of image to upload');
			imgImagePreview.setAttribute('width', '50%');
			imgImagePreview.style.display = 'none';
			spanImagePreview.appendChild(imgImagePreview);
		}
	}
} // UploadAddImagePreviewElement()

// end upload.js