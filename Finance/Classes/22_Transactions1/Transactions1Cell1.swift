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
class Transactions1Cell1: UICollectionViewCell {

	@IBOutlet var viewBackground: UIView!

	@IBOutlet var viewCard: UIView!
	@IBOutlet var imageCard: UIImageView!
	@IBOutlet var labelCardNumber: UILabel!

	//---------------------------------------------------------------------------------------------------------------------------------------------
	override func awakeFromNib() {

		super.awakeFromNib()

		viewCard.layer.borderWidth = 1
		viewCard.layer.borderColor = AppColor.Border.cgColor
	}

	//---------------------------------------------------------------------------------------------------------------------------------------------
	func bindData(data: [String: String]) {

		guard let card_number = data["card_number"] else { return }
		guard let card_type = data["card_type"] else { return }

		labelCardNumber.text = card_type + " " + card_number
	}

	//---------------------------------------------------------------------------------------------------------------------------------------------
	func setCell(isSelected: Bool) {

		viewBackground.backgroundColor = isSelected ? UIColor.systemBackground : UIColor.tertiarySystemFill
		viewBackground.layer.borderWidth = isSelected ? 1 : 0
		viewBackground.layer.borderColor = isSelected ? AppColor.Border.cgColor : UIColor.clear.cgColor
	}
}
