import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="index"
export default class extends Controller {
  static targets = ["memos"]
  static values = { sizememos: Number }

  connect() {
    const memos = this.memosTarget;
    const sizememos = this.sizememosValue;
    
    memos.classList.add("mx-auto", "w-full");
    if (sizememos == 1) {
      memos.classList.add("max-w-screen-sm");
    }
    else if (sizememos == 2) {
      memos.classList.add("grid", "md:gap-6", "sm:grid-cols-2", "gap-4", "max-w-screen-md");

    }
    else {
      memos.classList.add("grid", "md:gap-6", "lg:grid-cols-3", "sm:grid-cols-2", "gap-4", "max-w-screen-lg");
    }
  }
}
