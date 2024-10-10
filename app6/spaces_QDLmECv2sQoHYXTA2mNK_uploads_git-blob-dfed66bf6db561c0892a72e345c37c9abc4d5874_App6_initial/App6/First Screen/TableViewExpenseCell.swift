//
//  TableViewExpenseCell.swift
//  App5
//
//  Created by Sakib Miazi on 5/18/23.
//

import UIKit

class TableViewExpenseCell: UITableViewCell {
    var wrapperCellView: UIView!
    var labelTitle: UILabel!
    var labelAmount: UILabel!
    var labelType: UILabel!
    
    var imageReceipt: UIImageView!
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupWrapperCellView()
        setupLabelTitle()
        setupLabelAmount()
        setupLabelType()
        
        //MARK: defining the ImageView for receipt image...
        setupimageReceipt()
        
        initConstraints()
    }
    
    func setupimageReceipt(){
        imageReceipt = UIImageView()
        imageReceipt.image = UIImage(systemName: "photo")
        imageReceipt.contentMode = .scaleToFill
        imageReceipt.clipsToBounds = true
        imageReceipt.layer.cornerRadius = 10
        imageReceipt.translatesAutoresizingMaskIntoConstraints = false
        wrapperCellView.addSubview(imageReceipt)
    }
    
    func setupWrapperCellView(){
        wrapperCellView = UITableViewCell()
        
        //working with the shadows and colors...
        wrapperCellView.backgroundColor = .white
        wrapperCellView.layer.cornerRadius = 10.0
        wrapperCellView.layer.shadowColor = UIColor.gray.cgColor
        wrapperCellView.layer.shadowOffset = .zero
        wrapperCellView.layer.shadowRadius = 6.0
        wrapperCellView.layer.shadowOpacity = 0.7
        
        wrapperCellView.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(wrapperCellView)
    }
    
    func setupLabelTitle(){
        labelTitle = UILabel()
        labelTitle.translatesAutoresizingMaskIntoConstraints = false
        wrapperCellView.addSubview(labelTitle)
    }
    func setupLabelAmount(){
        labelAmount = UILabel()
        labelAmount.translatesAutoresizingMaskIntoConstraints = false
        wrapperCellView.addSubview(labelAmount)
    }
    func setupLabelType(){
        labelType = UILabel()
        labelType.translatesAutoresizingMaskIntoConstraints = false
        wrapperCellView.addSubview(labelType)
    }
    
    func initConstraints(){
        NSLayoutConstraint.activate([
            wrapperCellView.topAnchor.constraint(equalTo: self.topAnchor),
            wrapperCellView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            wrapperCellView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            wrapperCellView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            
            labelTitle.topAnchor.constraint(equalTo: wrapperCellView.topAnchor, constant: 2),
            labelTitle.leadingAnchor.constraint(equalTo: imageReceipt.trailingAnchor, constant: 8),
            labelTitle.heightAnchor.constraint(equalToConstant: 32),
            labelTitle.widthAnchor.constraint(lessThanOrEqualTo: wrapperCellView.widthAnchor),
            
            labelAmount.topAnchor.constraint(equalTo: labelTitle.bottomAnchor, constant: 2),
            labelAmount.leadingAnchor.constraint(equalTo: labelTitle.leadingAnchor),
            labelAmount.heightAnchor.constraint(equalToConstant: 32),
            labelAmount.widthAnchor.constraint(lessThanOrEqualTo: labelTitle.widthAnchor),
            
            labelType.topAnchor.constraint(equalTo: labelAmount.bottomAnchor, constant: 2),
            labelType.leadingAnchor.constraint(equalTo: labelTitle.leadingAnchor),
            labelType.heightAnchor.constraint(equalToConstant: 32),
            labelType.widthAnchor.constraint(lessThanOrEqualTo: labelTitle.widthAnchor),
            
            imageReceipt.leadingAnchor.constraint(equalTo: wrapperCellView.leadingAnchor, constant: 8),
            imageReceipt.centerYAnchor.constraint(equalTo: wrapperCellView.centerYAnchor),
            //MARK: it is better to set the height and width of an ImageView with constraints...
            imageReceipt.heightAnchor.constraint(equalTo: wrapperCellView.heightAnchor, constant: -20),
            imageReceipt.widthAnchor.constraint(equalTo: wrapperCellView.heightAnchor, constant: -20),
            
            wrapperCellView.heightAnchor.constraint(equalToConstant: 104)
        ])
    }
    
    //MARK: unused methods...
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
