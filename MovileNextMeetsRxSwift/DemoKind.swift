enum DemoKind {
    case events
    case state
    case autocomplete

    static let all: [DemoKind] = [.events, .state, .autocomplete]

    var title: String {
        switch self {
        case .events:
            return "Eventos de controles diversos"
        case .state:
            return "Explorando sequências com estado"
        case .autocomplete:
            return "Autocomplete"
        }
    }
}
