<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Kasbon;
use App\Models\Pegawai;
use DB;
use Validator;
class KasbonController extends Controller
{
    public function list(){
        $kasbon = Kasbon::join('pegawai','kasbon.pegawai_id','=','pegawai.id')
                    ->select(DB::raw("SUBSTR(pegawai.nama, 1, LOCATE(' ',nama)) AS nama"),
                    DB::raw("DATE_FORMAT(kasbon.tanggal_diajukan,'%d/%m/%Y') as tanggal_diajukan"),
                    DB::raw("DATE_FORMAT(kasbon.tanggal_disetujui,'%d/%m/%Y') as tanggal_disetujui"),
                    DB::raw("format(kasbon.total_kasbon, 0) as total_kasbon"))
                    ->paginate();
        return response()->json($kasbon);
    }

    public function post(Request $request){
        $getdata = array(
            'nama'=>'required|max:10',
            'tanggal_diajukan'=>'required',
            'tanggal_disetujui'=>'required',
            'total_kasbon'=>'required',
        );
        $validator = Validator::make($request->all(),$getdata);
        if($validator->fails()){
            return response()->json($validator->errors(),401);
        }else{
            $pegawai = Pegawai::where('nama',$request->nama)->first();
            $peg;
            if(isset($pegawai->id)){
                $peg = $pegawai->id;
            }else{
                $peg = 0;
            }
            $kasbon = new Kasbon;
            $kasbon->pegawai_id           = $peg;
            $kasbon->tanggal_diajukan  = $request->tanggal_diajukan;
            $kasbon->tanggal_disetujui = $request->tanggal_disetujui;
            $kasbon->total_kasbon      = $request->total_kasbon;
            $kasbon->save();
            return response()->json(['message'=>'success','data'=>$kasbon->paginate()]);
        }
    }

    public function setuju($id){
        $kasbon =  Kasbon::find($id);
        $kasbon->tanggal_disetujui = date('Y-m-d');
        $kasbon->save();
        return response()->json(['message'=>'success','data'=>$kasbon->paginate()]);
    }
}
