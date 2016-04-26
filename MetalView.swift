//
//  MetalView.swift
//  ios-metal
//
//  Created by Emiliano on 4/25/16.
//  Copyright © 2016 Emiliano. All rights reserved.
//

import UIKit
import MetalKit

class MetalView: MTKView {

    override func drawRect(rect: CGRect) {
        super.drawRect(rect)
        render()
    }
    
    func render() {
        let device = MTLCreateSystemDefaultDevice()!
        self.device = device
        let rpd = MTLRenderPassDescriptor()
        let bleen = MTLClearColor(red: 0, green: 0.5, blue: 0.5, alpha: 1)
        rpd.colorAttachments[0].texture = currentDrawable!.texture
        rpd.colorAttachments[0].clearColor = bleen
        rpd.colorAttachments[0].loadAction = .Clear
        let commandQueue = device.newCommandQueue()
        let commandBuffer = commandQueue.commandBuffer()
        let encoder = commandBuffer.renderCommandEncoderWithDescriptor(rpd)
        encoder.endEncoding()
        commandBuffer.presentDrawable(currentDrawable!)
        commandBuffer.commit()
    }

}
