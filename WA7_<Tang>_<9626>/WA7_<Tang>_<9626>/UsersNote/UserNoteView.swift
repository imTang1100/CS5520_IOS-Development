//
//  UserNoteView.swift
//  WA7_<Tang>_<9626>
//
//  Created by evan tang on 10/31/24.
//

import UIKit

class UserNoteView: UIView {
    var tableViewNotes: UITableView! 
    var textAddNote: UITextField!
    var addButton: UIButton!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .white

        setTable()
        setUI()
        
        initConstraints()
    }
    
    func setTable() {
        tableViewNotes = UITableView()
        tableViewNotes.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(tableViewNotes)
        tableViewNotes.register(NotesTableViewCell.self, forCellReuseIdentifier: "text")
    }
    
    func setUI() {
        textAddNote = UITextField()
        textAddNote.placeholder = "What's in your little mind?"
        textAddNote.borderStyle = .roundedRect
        textAddNote.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(textAddNote)
        
        addButton = UIButton(type: .system)
        addButton.titleLabel?.font = .boldSystemFont(ofSize: 16)
        addButton.setTitle("Add Note", for: .normal)
        addButton.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(addButton)
    }
    
    func initConstraints() {
        NSLayoutConstraint.activate([
            
            tableViewNotes.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 8),
            tableViewNotes.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 8),
            tableViewNotes.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -8),
            tableViewNotes.bottomAnchor.constraint(equalTo: textAddNote.topAnchor, constant: -8),
            
            textAddNote.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 8),
            textAddNote.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -8),
            textAddNote.bottomAnchor.constraint(equalTo: addButton.topAnchor, constant: -8),
        
            addButton.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 8),
            addButton.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -8),
            addButton.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor, constant: -16)
        
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
