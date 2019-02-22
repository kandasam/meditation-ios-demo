import UIKit

class SongViewCell: UITableViewCell {

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configureSubviews()
        addSubviews()
        setupLayout()
        interactiveView.reset()
    }

    required init?(coder aDecoder: NSCoder) { return nil }

    let interactiveView = SongInteractiveView()

    func animateAppearance(delay: TimeInterval, animator: Animating = Animator()) {
        guard !didPerformAppearanceAnimation else { return }
        interactiveView.animateAppearance(delay: delay,
                                          completion: { self.didPerformAppearanceAnimation = true })
    }

    override func prepareForReuse() {
        super.prepareForReuse()
        interactiveView.reset()
    }

    // MARK: - Privates

    let separatorView = UIView(frame: .zero)
    private var didPerformAppearanceAnimation = false

    private func configureSubviews() {
        selectionStyle = .none
        setSelected(false, animated: false)
    }

    private func addSubviews() {
        contentView.addSubview(interactiveView)
        contentView.addSubview(separatorView)
    }

    private func setupLayout() {
        interactiveView.pinEdges(to: contentView,
                                 edgeInsets: UIEdgeInsets(top: 1, left: 0, bottom: 1, right: 16))
        separatorView.pinLeading(to: interactiveView.songView.checkBoxView.leadingAnchor)
        separatorView.pinTrailing(to: trailingAnchor)
        separatorView.pinHeight(0.5)
        separatorView.pinBottom(to: contentView.bottomAnchor)
    }

}