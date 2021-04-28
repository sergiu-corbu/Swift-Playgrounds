import SwiftUI

struct AddSubsectionView: View {
    
    @Binding var HTapped: Bool
    @Binding var VTapped: Bool
    
    var body: some View {
        VStack {
            HStack {
                Text("ADD SUBSECTION")
                    .font(.subheadline)
                    .bold()
                    .foregroundColor(.deepBlue)
                    .padding(.bottom, 10)
            }
            HStack {
                Button(action: { VTapped.toggle()}, label: { VLine() })
                Divider()
                Button(action: { HTapped.toggle()}, label: { HLine() })
            }
        }
        .frame(width: width - 60 , height: 60)
    }
}

struct AddSubsectionView_Previews: PreviewProvider {
    static var previews: some View {
        AddSubsectionView(HTapped: .constant(false), VTapped: .constant(false))
        //OptionsView(viewModel: ViewModel(), index: 0)
       
    }
}
