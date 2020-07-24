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
class RecipesList4Cell: UITableViewCell {

	@IBOutlet var imageFood: UIImageView!
	@IBOutlet var viewRate: UIView!
	@IBOutlet var labelRate: UILabel!
	@IBOutlet var buttonFavorite: UIButton!
	@IBOutlet var labelName: UILabel!
	@IBOutlet var labelFoodName: UILabel!
	@IBOutlet var labelDuration: UILabel!
	@IBOutlet var labelPeople: UILabel!

	//---------------------------------------------------------------------------------------------------------------------------------------------
	override func awakeFromNib() {

		super.awakeFromNib()
		viewRate.layer.borderWidth = 1
		viewRate.layer.borderColor = AppColor.Border.cgColor

		buttonFavorite.layer.borderWidth = 1
		buttonFavorite.layer.borderColor = AppColor.Border.cgColor
	}

	//---------------------------------------------------------------------------------------------------------------------------------------------
	func bindData(index: IndexPath, data: [String: String]) {

		guard let rate = data["rate"] else { return }
		guard let name = data["name"] else { return }
		guard let foodName = data["foodName"] else { return }
		guard let duration = data["duration"] else { return }
		guard let people = data["people"] else { return }

		imageFood.sample("Food", "Vegan", index.row)
		labelRate.text = rate
		labelName.text = name
		labelFoodName.text = foodName
		labelDuration.text = duration
		labelPeople.text = people
	}
}
