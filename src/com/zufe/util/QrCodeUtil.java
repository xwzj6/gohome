package com.zufe.util;

import java.io.ByteArrayOutputStream;

import java.io.FileOutputStream;

import java.io.IOException;

import java.io.OutputStream;

import java.util.HashMap;

import java.util.Map;

import com.google.zxing.BarcodeFormat;

import com.google.zxing.EncodeHintType;

import com.google.zxing.MultiFormatWriter;

import com.google.zxing.WriterException;

import com.google.zxing.client.j2se.MatrixToImageWriter;

import com.google.zxing.common.BitMatrix;

import com.google.zxing.qrcode.decoder.ErrorCorrectionLevel;

public class QrCodeUtil {

	public static byte[] createQRCode(int width, int height, String content)
			throws WriterException, IOException {

		// ��ά�������������

		Map<EncodeHintType, Object> hints = new HashMap<EncodeHintType, Object>();

		hints.put(EncodeHintType.CHARACTER_SET, "utf-8");// ���ñ����ַ���utf-8

		hints.put(EncodeHintType.ERROR_CORRECTION, ErrorCorrectionLevel.M);// ���þ���ȼ�L/M/Q/H,����ȼ�Խ��Խ����ʶ�𣬵�ǰ���õȼ�Ϊ��ߵȼ�H

		hints.put(EncodeHintType.MARGIN, 0);// �����÷�ΧΪ0-10�������ĸ��仯0 1(2) 3(4 5 6)
											// 7(8 9 10)

		// ����ͼƬ����ΪQRCode

		BarcodeFormat format = BarcodeFormat.QR_CODE;

		// ����λ�������

		BitMatrix bitMatrix = new MultiFormatWriter().encode(content, format,
				width, height, hints);

		// ����λ����תͼƬ�Ĳ���

		// MatrixToImageConfig config = new
		// MatrixToImageConfig(Color.black.getRGB(), Color.white.getRGB());

		// λ�������ת������

		ByteArrayOutputStream os = new ByteArrayOutputStream();

		MatrixToImageWriter.writeToStream(bitMatrix, "png", os);

		return os.toByteArray();

	}

	public static void main(String[] args) throws WriterException, IOException {

		byte[] b = createQRCode(100, 100, "������õ��Լ���");

		OutputStream os = new FileOutputStream("D:\\1.png");

		os.write(b);

		os.close();

	}

}