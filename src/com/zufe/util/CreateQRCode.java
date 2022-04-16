package com.zufe.util;

import java.awt.image.BufferedImage;
import java.io.File;
import java.util.HashMap;
import java.util.Map;

import javax.imageio.ImageIO;

import com.google.zxing.BarcodeFormat;
import com.google.zxing.Binarizer;
import com.google.zxing.BinaryBitmap;
import com.google.zxing.EncodeHintType;
import com.google.zxing.LuminanceSource;
import com.google.zxing.Result;
import com.google.zxing.WriterException;
import com.google.zxing.client.j2se.BufferedImageLuminanceSource;
import com.google.zxing.client.j2se.MatrixToImageWriter;
import com.google.zxing.common.BitMatrix;
import com.google.zxing.common.HybridBinarizer;
import com.google.zxing.qrcode.QRCodeReader;
import com.google.zxing.qrcode.QRCodeWriter;

//生成二维码
public class CreateQRCode {

	/**
	 * 生成二维码图片文件（不带LOGO）
	 * 
	 * @param content
	 *            要生成二维码的内容
	 * @param width
	 *            二维码的高度
	 * @param height
	 *            二维码的宽度
	 * @return 二维码图片
	 * @throws WriterException
	 *             异常
	 */
	/*
	 * private static BufferedImage genQrcode(String content, int width, int
	 * height) throws WriterException { Map<EncodeHintType, String> hints = new
	 * HashMap<EncodeHintType, String>();
	 * hints.put(EncodeHintType.CHARACTER_SET, "UTF-8"); QRCodeWriter writer =
	 * new QRCodeWriter(); //根据高度和宽度生成像素矩阵 BitMatrix bitMatrix =
	 * writer.encode(content, BarcodeFormat.QR_CODE, width, height, hints);
	 * 
	 * BufferedImage image = new BufferedImage(bitMatrix.getWidth(),
	 * bitMatrix.getHeight(), BufferedImage.TYPE_INT_RGB); for (int x = 0; x <
	 * bitMatrix.getWidth(); x++) { for (int y = 0; y < bitMatrix.getHeight();
	 * y++) { //填充黑白两色 image.setRGB(x, y, bitMatrix.get(x, y) ? BLACK : WHITE);
	 * } }
	 * 
	 * return image; }
	 */
	public static void main(String[] args) {
		String content = "hello";
		// content = new String(content.getBytes("GBK"),"utf-8");
		String imagePath = "d:\\code.png";
		File file = new File(imagePath);

		QRCodeWriter writer = new QRCodeWriter();
		try {
			// 生成二维码
			BitMatrix matrix = writer.encode(content, BarcodeFormat.QR_CODE,
					200, 200);
			MatrixToImageWriter.writeToFile(matrix, "png", file);
			// 读取二维码
			QRCodeReader reader = new QRCodeReader();
			BufferedImage image = ImageIO.read(file);
			LuminanceSource source = new BufferedImageLuminanceSource(image);
			Binarizer binarizer = new HybridBinarizer(source);
			BinaryBitmap imageBinaryBitmap = new BinaryBitmap(binarizer);
			Result result = reader.decode(imageBinaryBitmap);
			System.out.println("result = " + result.toString());
			System.out.println("resultFormat = " + result.getBarcodeFormat());
			System.out.println("resultText = " + result.getText());
		} catch (Exception e) {
			e.printStackTrace();
		}

	}
}
