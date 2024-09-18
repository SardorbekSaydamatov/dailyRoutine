
import SwiftUI


struct SideMenuRawValue: View {
    let option: SideMenuOptionModel
    @Binding var selectedOption: SideMenuOptionModel?
    
    private var isSelected: Bool {
        return selectedOption == option
    }
    var body: some View {
        HStack {
            Text(option.title)
            
            Spacer()
        }
        .padding(.leading)
        .foregroundStyle(isSelected ? .blue : .primary)
        .frame(width: 200, height: 44)
        .background(isSelected ? .blue.opacity(0.15) : .clear)
        .clipShape(RoundedRectangle(cornerRadius: 8))
    }
}

#Preview {
    SideMenuRawValue(option: .mainView, selectedOption: .constant(.mainView))
}
