@extends('admin.layouts.master')


@section('custom-css')
<meta name="csrf-token" content="{{ csrf_token() }}">
@endsection

@section('content')

<!-- ============================================================== -->
<!-- Start Page Content -->
<!-- ============================================================== -->

<div class="row">
    <div class="col-12">
        <div class="card">
            <div class="card-body">
                <?php
                    $message = Session::get('msg');
                      if (isset($message)) {
                        echo"<div style='display:inline-block;width: auto;' class='alert alert-success'><strong>" .$message."</strong></div>";
                      }

                      Session::forget('msg')
                  
                ?>
                <h4 class="card-title">Update About Us Information</h4>
                <br>

                  <div id="editAbout" class="">
    <div class="">        
        <div class="">
            
            <form class="form-horizontal" action="{{route('about.update')}}" method="POST" enctype="multipart/form-data" name="editAbout">
            {{ csrf_field() }}

                <input type="hidden" name="aboutId" value="{{$about->id}}">

                <div class="col-md-12 m-b-20 text-right">    
                    <button type="submit" class="btn btn-info waves-effect">Update</button> 
                </div>

                <div class="form-group row {{ $errors->has('title') ? ' has-danger' : '' }}">
                    <label for="inputHorizontalDnger" class="col-sm-3 col-form-label">Title</label>
                    <div class="col-sm-9">
                        <input type="text" class="form-control form-control-danger" placeholder="Title" name="title" value="{{ @$about->title  }}" required>
                        @if ($errors->has('name'))
                        @foreach($errors->get('name') as $error)
                        <div class="form-control-feedback">{{ $error }}</div>
                        @endforeach
                        @endif
                    </div>
                </div>

                 <div class="form-group row {{ $errors->has('aboutDescription') ? ' has-danger' : '' }}">
                    <label for="inputHorizontalDnger" class="col-sm-3 col-form-label">About Content</label>
                    <div class="col-sm-9">
                        <textarea class="summernote form-control form-control-danger" name="aboutDescription" required>{{ @$about->aboutDescription }}</textarea>
                        
                    </div>
                </div>
               
               
               
                <div class="form-group row {{ $errors->has('metaTitle') ? ' has-danger' : '' }}">
                    <label for="inputHorizontalDnger" class="col-sm-3 col-form-label">Meta Title</label>
                    <div class="col-sm-9">
                        <input type="text" class="form-control form-control-danger" placeholder="Meta Title" name="metaTitle" value="{{ @$about->metaTitle }}">
                        @if ($errors->has('metaTitle'))
                        @foreach($errors->get('metaTitle') as $error)
                        <div class="form-control-feedback">{{ $error }}</div>
                        @endforeach
                        @endif
                    </div>
                </div>

                <div class="form-group row {{ $errors->has('metaKeyword') ? ' has-danger' : '' }}">
                    <label for="inputHorizontalDnger" class="col-sm-3 col-form-label">Meta keyword</label>
                    <div class="col-sm-9">
                        <input type="text" class="form-control form-control-danger" placeholder="Meta Keyword" name="metaKeyword" value="{{ @$about->metaKeyword }}">
                        @if ($errors->has('metaKeyword'))
                        @foreach($errors->get('metaKeyword') as $error)
                        <div class="form-control-feedback">{{ $error }}</div>
                        @endforeach
                        @endif
                    </div>
                </div>

                <div class="form-group row {{ $errors->has('description') ? ' has-danger' : '' }}">
                    <label for="inputHorizontalDnger" class="col-sm-3 col-form-label">Meta description</label>
                    <div class="col-sm-9">
                        <textarea style="min-height: 100px;" class="form-control" name="metaDescription">{{ @$about->metaDescription }}</textarea>
                        @if ($errors->has('metaDescription'))
                        @foreach($errors->get('metaDescription') as $error)
                        <div class="form-control-feedback">{{ $error }}</div>
                        @endforeach
                        @endif
                    </div>
                </div>

                 <div class="form-group row {{ $errors->has('status') ? ' has-danger' : '' }}">
                    <label class="col-sm-3 col-form-label">Publication Status</label>
                    <div class="col-sm-9 row">
                        <div class="form-control">
                            <div class="custom-control custom-radio">
                                <input type="radio" id="published" name="status" class="custom-control-input" value="1" required>
                                <label class="custom-control-label" for="published">Published</label>
                            </div>
                            <div class="custom-control custom-radio">
                                <input type="radio" id="unpublished" name="status" class="custom-control-input" checked="" value="0">
                                <label class="custom-control-label" for="unpublished">Unpublished</label>
                            </div>
                        </div>                            
                    </div>
                </div>


                
            </div>                
            </form>
        </div>
    </div>
    <!-- /.modal-dialog -->
</div>
                
            </div>
        </div>
    </div>
</div>



    <script type="text/javascript">

        document.forms['editAbout'].elements['status'].value = "{{$about->status}}";

    </script>

@endsection

@section('custom-js')

<script src="{{ asset('/public/admin-elite/assets/node_modules/datatables/jquery.dataTables.min.js') }}"></script>



 <script>
        $(document).ready(function() {
            $('.summernote').summernote({
                height: 400, // set editor height
                minHeight: null, // set minimum height of editor
                maxHeight: null, // set maximum height of editor
                focus: false // set focus to editable area after initializing summernote
            });

            var updateThis ;

            // Switchery
            var elems = Array.prototype.slice.call(document.querySelectorAll('.js-switch'));
            $('.js-switch').each(function() {
                new Switchery($(this)[0], $(this).data());
            });

            var table = $('#productsTable').DataTable( {
                "order": [[ 0, "asc" ]]
            } );

            table.on('order.dt search.dt', function () {
                table.column(0, {search:'applied', order:'applied'}).nodes().each( function (cell, i) {
                    cell.innerHTML = i+1;
                } );
            } ).draw();

            

        });
 
            function summernote(){
                $('.summernote').summernote({
                    height: 400, // set editor height
                    minHeight: null, // set minimum height of editor
                    maxHeight: null, // set maximum height of editor
                    focus: false // set focus to editable area after initializing summernote
                });
            }
    </script>

    @endsection