<?php

namespace App\Http\Controllers;

use App\Models\Szavak;
use Illuminate\Http\Request;

class SzavakController extends Controller
{
    //
    public function getAll() {
        return Szavak::all();
    }

    public function getByTema($tema) {
        return Szavak::join("temas", "szavaks.temaId", "=", "temas.id")->where("temanev", "=", $tema)->get();
    }
}
