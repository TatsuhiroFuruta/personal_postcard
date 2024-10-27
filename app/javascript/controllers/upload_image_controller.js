import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="upload-image"
export default class extends Controller {
  static targets = ["image_change_explanation", "image_upload_button", "input", "preview"]

  previewImage() {
    const image_change_explanation = this.image_change_explanationTarget
    const image_upload_button = this.image_upload_buttonTarget
    const input = this.inputTarget
    const preview = this.previewTarget
    
    const file = input.files[0]
    
    const reader = new FileReader()
    
    reader.onloadend = function () {
      if (preview.hasChildNodes()) {
        preview.innerHTML='';
      }
      else{
        image_change_explanation.textContent="「画像を変更する」ボタンを押して画像ファイルをアップロードすることで、投稿画像を変更できます。";
        image_upload_button.textContent="画像を変更する";
      }
      const img = document.createElement("img"); // img要素を作成
      const p = document.createElement("p"); // p要素を作成
      p.classList.add("mx-auto", "p-3");
      img.src = reader.result;
      p.textContent="ファイル名："+file.name;
      preview.appendChild(p);
      preview.appendChild(img);
    }

    if (file) {
      reader.readAsDataURL(file);
    }
  }
}
