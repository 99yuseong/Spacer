import SwiftUI

/// A view modifier that adds spacers based on the specified edges.
public struct SpacerModifier: ViewModifier {
    public let edge: Edge.Set          // The edge(s) where spacers should be added.
    public let minLength: CGFloat      // The minimum length for each spacer.
    
    public init(edge: Edge.Set, minLength: CGFloat) {
        self.edge = edge
        self.minLength = minLength
    }
    
    public func body(content: Content) -> some View {
        switch edge {
        case .leading, .trailing, .horizontal:
            // Create a horizontal stack with spacers on leading/trailing edges
            HStack(spacing: 0) {
                if edge == .leading || edge == .horizontal {
                    Spacer(minLength: minLength)
                }
                
                content
                
                if edge == .trailing || edge == .horizontal {
                    Spacer(minLength: minLength)
                }
            }
            
        case .top, .bottom, .vertical:
            // Create a vertical stack with spacers on top/bottom edges
            VStack(spacing: 0) {
                if edge == .top || edge == .vertical {
                    Spacer(minLength: minLength)
                }
                
                content
                
                if edge == .bottom || edge == .vertical {
                    Spacer(minLength: minLength)
                }
            }
            
        case .all:
            // Create a vertical stack with spacers on all sides
            VStack(spacing: 0) {
                Spacer(minLength: minLength)
                
                // Center content with spacers on both sides
                HStack(spacing: 0) {
                    Spacer(minLength: minLength)
                    content
                    Spacer(minLength: minLength)
                }
                
                Spacer(minLength: minLength)
            }
            
        default:
            // If no recognized edge is provided, return content as is
            content
        }
    }
}

extension View {
    /// Applies the SpacerModifier to the view, adding spacers based on the specified edge(s).
    /// - Parameters:
    ///   - edge: The edge(s) where spacers should be added.
    ///   - minLength: The minimum length for each spacer (default is 0).
    /// - Returns: A view with the applied spacer modifier.
    public func spacer(_ edge: Edge.Set, minLength: CGFloat = 0) -> some View {
        self.modifier(SpacerModifier(edge: edge, minLength: minLength))
    }
}
