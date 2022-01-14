<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Pegawai;
use DB;
use Validator;

class PegawaiController extends Controller
{
    public function list(){
        $pegawai = Pegawai::select(DB::raw("SUBSTR(nama, 1, LOCATE(' ', nama)) AS nama"),
                    DB::raw("DATE_FORMAT(tanggal_masuk,'%d/%m/%Y') as tanggal_masuk"),
                    DB::raw("format(total_gaji, 0) as total_gaji"))->paginate();
        return response()->json($pegawai);
    }

    public function post(Request $request){
        $getdata = array(
            'nama'=>'required|max:10',
            'tanggal_masuk'=>'required',
            'total_gaji'=>'required',
        );
        $validator = Validator::make($request->all(),$getdata);
        if($validator->fails()){
            return response()->json($validator->errors(),401);
        }else{
            $pegawai = new Pegawai;
            $pegawai->nama = $request->nama;
            $pegawai->tanggal_masuk = $request->tanggal_masuk;
            $pegawai->total_gaji = $request->total_gaji;
            $pegawai->save();
            return response()->json(['message'=>'success','data'=>$pegawai->paginate()]);
        }
    }
}
