@extends('layout/layout-common')
@section('space-work')

    <h1>Login</h1>
    @if($errors->any())
        @foreach($errors->all() as $errors)
        <p style='color:red;'>{{$errors}}</p>
        @endforeach
    @endif
    @if(Session::has('error'))
        <p style='color:red;'>{{Session::get('error')}}</p>
     @endif

    <form action="{{route('userlogin')}}" method="POST">
         @csrf
         <input type="email" name="email" placeholder="Enter email">
         <br><br>
         <input type="password" name="password" placeholder="Enter password">
         <br><br>
         <input type="submit" value="login">


       
         
         

    </form>

@endsection

