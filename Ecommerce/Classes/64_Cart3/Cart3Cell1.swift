//
// Copyright (c) 2020 Related Code - http://relatedcode.com
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
// THE SOFTWARE.

import UIKit

//-------------------------------------------------------------------------------------------------------------------------------------------------
class Cart3Cell1: UITableViewCell {

	@IBOutlet var imageProduct: UIImageView!

	@IBOutlet var labelTitle: UILabel!

	@IBOutlet var labelColor: UILabel!
	@IBOutlet var labelQuantity: UILabel!
	@IBOutlet var labelSize: UILabel!

	@IBOutlet var labelPrice: UILabel!
	@IBOutlet var labelOriginalPrice: UILabel!

	@IBOutlet var buttonFavorite: UIButton!
	@IBOutlet var buttonDelete: UIButton!

	//---------------------------------------------------------------------------------------------------------------------------------------------
	override func awakeFromNib() {

		super.awakeFromNib()

		buttonFavorite.layer.borderWidth = 1
		buttonFavorite.layer.borderColor = AppColor.Border.cgColor

		buttonDelete.layer.borderWidth = 1
		buttonDelete.layer.borderColor = AppColor.Border.cgColor
	}

	//---------------------------------------------------------------------------------------------------------------------------------------------
	func bindData(index: IndexPath, data: [String: String]) {

		guard let title = data["title"] else { return }
		guard let price = data["price"] else { return }
		guard let originalPrice = data["originalPrice"] else { return }
		guard let color = data["color"] else { return }
		guard let quantity = data["quantity"] else { return }
		guard let size = data["size"] else { return }

		imageProduct.sample("Ecommerce", "Shoes", index.row+5)
		labelTitle.text = title
		labelPrice.text = price
		labelOriginalPrice.text = originalPrice
		labelOriginalPrice.isHidden = (originalPrice == "")
		labelColor.text = "Color: " + color
		labelQuantity.text = "QTY: " + quantity
		labelSize.text = "Size: " + size
	}
}
