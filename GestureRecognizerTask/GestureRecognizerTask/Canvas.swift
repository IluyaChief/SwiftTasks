import UIKit

class Canvas: UIView {
    var lines = [[CGPoint]]()
    var dot = [CGRect]()
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        drawLine()
        drawDot()
    }
    
    func drawLine() {
        guard let context = UIGraphicsGetCurrentContext() else { return }
        context.setStrokeColor(UIColor.gray.cgColor)
        context.setLineWidth(3)
        lines.forEach { (Line) in
            for (i, p) in Line.enumerated() {
                if i == 0 {
                    context.move(to: p)
                } else {
                    context.addLine(to: p)
                }
            }
        }
        context.strokePath()
    }
    func drawDot() {
        guard let context = UIGraphicsGetCurrentContext() else { return }
        for (_, p) in dot.enumerated() {
            context.addEllipse(in: p)
            context.fillPath()
        }
        context.fillPath()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard let point = touches.first?.location(in: nil) else { return }
        dot.append(CGRect(origin: point, size: CGSize(width: Const.dotSize, height: Const.dotSize)))
        lines.append([CGPoint]())
        setNeedsDisplay()
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard let point = touches.first?.location(in: nil) else { return }
        guard var LastLine = lines.popLast() else { return }
        LastLine.append(point)
        lines.append(LastLine)
        setNeedsDisplay()
    }
}
