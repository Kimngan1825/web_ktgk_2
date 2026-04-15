<?php

namespace App\Http\Controllers;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

class Controller5 extends Controller
{
    public function search(Request $request)
    {
        $keyword = $request->input('keyword');

        $sanPhams = DB::table('san_pham')
                    ->where('ten_san_pham', 'like', '%' . $keyword . '%')
                    ->get();

        return view('caycanh.timkiem', [
            'sanPhams' => $sanPhams, 
            'keyword' => $keyword
        ]);
    }
}