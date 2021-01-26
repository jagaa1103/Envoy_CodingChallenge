//
//  ListView.swift
//  CoffeeShop
//
//  Created by Enkhjargal Gansukh on 2021.01.13.
//

import SwiftUI

struct ListView: View {
    @ObservedObject var viewModel = ListViewModel()
    var body: some View {
        NavigationView {
            List(viewModel.venueList.indexed(), id: \.1.id) { (index, venue) in
                ListItemView(venue: venue)
            }
            .navigationTitle("Coffee Shops")
        }
        .onAppear {
            DispatchQueue.global().async {
                viewModel.fetchVenueList()
            }
        }
    }
}

//struct ListView_Previews: PreviewProvider {
//    static var previews: some View {
//        ListView()
//    }
//}




struct IndexedCollection<Base: RandomAccessCollection>: RandomAccessCollection
{
     typealias Index = Base.Index
     typealias Element = (index: Index, element: Base.Element)

     let base: Base
     var startIndex: Index { base.startIndex }
     var endIndex: Index { base.endIndex }

     func index(after i: Index) -> Index {   base.index(after: i)    }

     func index(before i: Index) -> Index {  base.index(before: i)   }

     func index(_ i: Index, offsetBy distance: Int) -> Index {  base.index(i, offsetBy: distance)    }

     subscript(position: Index) -> Element {  (index: position, element: base[position])     }
}

extension RandomAccessCollection {
    func indexed() -> IndexedCollection<Self>
    {
        IndexedCollection(base: self)
    }
}
