//
//  HomeVC.swift
//  KavakTest
//
//  Created by Miguel Mexicano Herrera on 19/06/21.
//

import UIKit

class HomeVC: UIViewController {
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var professionsText: UITextField!
    var presenter: HomePresenterProtocol?
    let professionPicker = UIPickerView()
    var dataSource: [citizensBrastlewark] = [citizensBrastlewark]()
    var allData: [citizensBrastlewark] = [citizensBrastlewark]()
    var professions: [String] = [String]()
    @IBOutlet weak var collectionView: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Brastlewark"
        setupCollectionView()
    }
    func getData() {
        presenter?.getInformation()
    }
    func setupCollectionView() {
        searchBar.delegate = self
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(UINib(nibName: "HomeCollectionCell", bundle: nil), forCellWithReuseIdentifier: "HomeCollectionCell")
        getData()
    }
    func setupProfessionsPicker() {
        professions = [String]()
        professions.append("Selecciona Profesion")
        professions.append(contentsOf: allData.flatMap({$0.professions}).uniqued().sorted(by: <))
        professionsText.inputView = professionPicker
        professionPicker.delegate = self
        professionPicker.dataSource = self
        professionsText.autocorrectionType = .no
        let toolBar = UIToolbar()
        toolBar.barStyle = .default
        toolBar.isTranslucent = true
        toolBar.tintColor = .blue_color
        toolBar.sizeToFit()
        let doneButton = UIBarButtonItem(title: "Seleccionar", style: .done, target: self, action: #selector(doneRoutePicker))
        let spaceButton = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        let cancelButton = UIBarButtonItem(title: "Cancelar", style: .plain, target: self, action: #selector(cancelRoute))
        toolBar.setItems([cancelButton, spaceButton, doneButton], animated: false)
        toolBar.isUserInteractionEnabled = true
        professionsText.inputAccessoryView = toolBar
    }
    @objc func doneRoutePicker(){
        professionsText.resignFirstResponder()
        let select = professionPicker.selectedRow(inComponent: 0)
        let profession = professions[select]
        professionsText.text = profession
        updateData(profession: profession)
    }
    @objc func cancelRoute(){
        professionsText.resignFirstResponder()
    }
    override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        collectionView.reloadData()
    }
    func updateData(profession: String) {
        dataSource = allData
        dataSource = dataSource.filter({ $0.professions.contains(profession) })
        collectionView.reloadData()
    }
}
extension HomeVC: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let totalespace: CGFloat = 16 * 3
        let width = UIScreen.main.bounds.width - totalespace
        return CGSize(width: width/2, height: 250)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 16)
    }
}
extension HomeVC: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        guard let header = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "SearchCollectionReusableView", for: indexPath) as? SearchCollectionReusableView else {
            return UICollectionReusableView()
        }
        return header
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dataSource.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "HomeCollectionCell", for: indexPath) as? HomeCollectionCell else { return UICollectionViewCell() }
        cell.setupCell(data: dataSource[indexPath.row])
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        presenter?.pressDetail(data: dataSource[indexPath.row])
    }
}
extension HomeVC: UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        guard let text = searchBar.text, !text.isEmpty else {
            searchBar.endEditing(true)
            return
        }
        searchBar.endEditing(true)
    }
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchText.isEmpty {
            dataSource = allData
        } else {
            dataSource = dataSource.filter({ $0.name.contains(searchText)})
        }
        collectionView.reloadData()
    }
    func searchBarTextDidEndEditing(_ searchBar: UISearchBar) {
        collectionView.reloadData()
    }
}
extension HomeVC: UIPickerViewDelegate,UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return professions.count
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return professions[row]
    }
}
/// Protocolo para recibir datos de presenter.
extension HomeVC: HomeViewProtocol {
    func showData(data: [citizensBrastlewark]) {
        dataSource = data
        allData = data
        setupProfessionsPicker()
        collectionView.reloadData()
    }
}
