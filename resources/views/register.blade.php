@extends('layout/layout-common')
@section('space-work')

    <h1>Register</h1>
    @if($errors->any())
        @foreach($errors->all() as $errors)
        <p style='color:red;'>{{$errors}}</p>
        @endforeach
    @endif
    <form action="{{route('studentRegister')}}" method="POST">
         @csrf
         <input type="text" name="name" placeholder="Enter name">
         <br><br>
         <input type="email" name="email" placeholder="Enter email">
         <br><br>
         <input type="password" name="password" placeholder="Enter password">
         <br><br>
         <input type="password" name="password_confirmation" placeholder="Enter password again">
         <br><br>
         <input type="submit" value="register">


         @if(Session::has('success'))
        <p style='color:green;'>{{Session::get('success')}}</p>
         @endif
         
         

    </form>

@endsection

