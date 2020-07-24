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
class Walkthrough5View: UIViewController {

	@IBOutlet var collectionView: UICollectionView!
	@IBOutlet var pageControl: UIPageControl!

	private var collections: [[String: String]] = []

	//---------------------------------------------------------------------------------------------------------------------------------------------
	override func viewDidLoad() {

		super.viewDidLoad()

		collectionView.register(UINib(nibName: "Walkthrough5Cell", bundle: nil), forCellWithReuseIdentifier: "Walkthrough5Cell")

		pageControl.pageIndicatorTintColor = UIColor.lightGray
		pageControl.currentPageIndicatorTintColor = AppColor.Theme

		loadCollections()
	}

	// MARK: - Collections methods
	//---------------------------------------------------------------------------------------------------------------------------------------------
	func loadCollections() {

		collections.removeAll()

		var dict1: [String: String] = [:]
		dict1["feature1"] = "Feature #1"
		dict1["description1"] = "A healthy body through exercise, nutrition, sleep, etc."
		dict1["feature2"] = "Feature #2"
		dict1["description2"] = "Being in touch with, aware of, accepting of, and able to express one’s feelings (and those of others)."
		collections.append(dict1)

		var dict2: [String: String] = [:]
		dict2["feature1"] = "Feature #1"
		dict2["description1"] = "A healthy physical environment free of hazards; awareness of the role we play in bettering rather than denigrating the natural environment"
		dict2["feature2"] = "Feature #2"
		dict2["description2"] = "Our search for meaning and purpose in human existence"
		collections.append(dict2)

		collections.append(dict1)
		collections.append(dict2)

		refreshCollectionView()
	}

	// MARK: - User actions
	//---------------------------------------------------------------------------------------------------------------------------------------------
	@IBAction func actionSkip(_ sender: UIButton) {

		dismiss(animated: true)
	}

	// MARK: - Refresh methods
	//---------------------------------------------------------------------------------------------------------------------------------------------
	func refreshCollectionView() {

		collectionView.reloadData()
	}
}

// MARK:- UICollectionViewDataSource
//-------------------------------------------------------------------------------------------------------------------------------------------------
extension Walkthrough5View: UICollectionViewDataSource {

	//---------------------------------------------------------------------------------------------------------------------------------------------
	func numberOfSections(in collectionView: UICollectionView) -> Int {

		return 1
	}

	//---------------------------------------------------------------------------------------------------------------------------------------------
	func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {

		return collections.count
	}

	//---------------------------------------------------------------------------------------------------------------------------------------------
	func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

		let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Walkthrough5Cell", for: indexPath) as! Walkthrough5Cell
		cell.bindData(index: indexPath.item, data: collections[indexPath.row])
		return cell
	}
}

// MARK:- UICollectionViewDelegate
//-------------------------------------------------------------------------------------------------------------------------------------------------
extension Walkthrough5View: UICollectionViewDelegate {

	//---------------------------------------------------------------------------------------------------------------------------------------------
	func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {

		print("didSelectItemAt \(indexPath.row)")
	}

	//---------------------------------------------------------------------------------------------------------------------------------------------
	func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {

		pageControl.currentPage = indexPath.row
	}
}

// MARK:- UICollectionViewDelegateFlowLayout
//-------------------------------------------------------------------------------------------------------------------------------------------------
extension Walkthrough5View: UICollectionViewDelegateFlowLayout {

	//---------------------------------------------------------------------------------------------------------------------------------------------
	func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {

		let height = collectionView.frame.size.height
		let width = collectionView.frame.size.width

		return CGSize(width: width, height: height)
	}

	//---------------------------------------------------------------------------------------------------------------------------------------------
	func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {

		return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
	}

	//---------------------------------------------------------------------------------------------------------------------------------------------
	func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {

		return 0
	}

	//---------------------------------------------------------------------------------------------------------------------------------------------
	func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {

		return 0
	}
}
