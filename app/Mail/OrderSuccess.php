<?php

namespace App\Mail;

use Illuminate\Bus\Queueable;
use Illuminate\Mail\Mailable;
use Illuminate\Mail\Mailables\Content;
use Illuminate\Mail\Mailables\Envelope;
use Illuminate\Queue\SerializesModels;

class OrderSuccess extends Mailable
{
    use Queueable, SerializesModels;

    public $maDonHang;
    public $cart;

    // Nhận dữ liệu truyền vào từ Controller
    public function __construct($maDonHang, $cart)
    {
        $this->maDonHang = $maDonHang;
        $this->cart = $cart;
    }

    public function envelope(): Envelope
    {
        return new Envelope(
            subject: 'Xác nhận đặt hàng thành công - Mã đơn: #' . $this->maDonHang,
        );
    }

    public function content(): Content
    {
        // Trỏ tới file giao diện của Email
        return new Content(
            view: 'emails.order_success',
        );
    }
}