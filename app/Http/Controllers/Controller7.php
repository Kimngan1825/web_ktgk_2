<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

class Controller7 extends Controller
{
    public function index() {
        $sanPhams = DB::table('san_pham')->where('status', 1)->get();
        return view('caycanh.qlycay', compact('sanPhams'));
    }

    public function destroy($id) {
        DB::table('san_pham')->where('id', $id)->update(['status' => 0]);
        return redirect()->back();
    }
}