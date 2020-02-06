<?php

namespace App;

use Intervention\Image\ImageManagerStatic as Image;
use  File;

class helperClass
{
    /**
     * Upload Image to the specified location. Later it will upload by date.
     * @return updated frontend setting.
     */
    public static function _uploadImage($file)
    {
        $data = getimagesize($file);
        $width = $data[0];
        $height = $data[1];

        $logoName = date("Y_m_d_H_i_s_u").'-'.str_random(20);
        $logoExtension = $file->getClientOriginalExtension();

        if($logoExtension=='pdf' || $logoExtension=='doc' || $logoExtension=='docx' ){

            $directory = 'public/uploads/cv/'.date('Y_m_d').'/';
            if(!file_exists ($directory))
            mkdir($directory);
            move_uploaded_file($file, "$directory$logoName.$logoExtension");
            return $directory.($logoName.'.'.$logoExtension);
        }

        $directory = 'public/uploads/images/'.date('Y_m_d').'/';
        if(!file_exists ($directory))
            mkdir($directory);
        $logoUrl = $directory.($logoName.'.'.$logoExtension);
        Image::make($file)->resize(min(1200,$width) , min(800,$height))->save($logoUrl);  
        return $logoUrl;
    }

    public static function _categoryCoverImage($file)
    {
        $data = getimagesize($file);
        $width = $data[0];
        $height = $data[1];

        $logoName = date("Y_m_d_H_i_s_u").'-'.str_random(20);
        $logoExtension = $file->getClientOriginalExtension();
        $name = $file->getClientOriginalName();

        if($logoExtension=='pdf' || $logoExtension=='doc' || $logoExtension=='docx' ){

            $directory = 'public/uploads/cv/'.date('Y_m_d').'/';
            if(!file_exists ($directory))
            mkdir($directory);
            move_uploaded_file($file, "$directory$logoName.$logoExtension");
            return $directory.($logoName.'.'.$logoExtension);
        }

        $directory = 'public/uploads/category_image/categoryCoverImage/';
        if(!file_exists ($directory))
            mkdir($directory);
        $logoUrl = $directory.($name);
        Image::make($file)->resize(min(1200,$width) , min(800,$height))->save($logoUrl);  
        return $logoUrl;
    }

    public static function _categoryImage($file)
    {
        $data = getimagesize($file);
        $width = $data[0];
        $height = $data[1];

        $logoName = date("Y_m_d_H_i_s_u").'-'.str_random(20);
        $logoExtension = $file->getClientOriginalExtension();
        $name = $file->getClientOriginalName();

        if($logoExtension=='pdf' || $logoExtension=='doc' || $logoExtension=='docx' ){

            $directory = 'public/uploads/cv/'.date('Y_m_d').'/';
            if(!file_exists ($directory))
            mkdir($directory);
            move_uploaded_file($file, "$directory$logoName.$logoExtension");
            return $directory.($logoName.'.'.$logoExtension);
        }

        $directory = 'public/uploads/category_image/';
        if(!file_exists ($directory))
            mkdir($directory);
        $logoUrl = $directory.($name);
        Image::make($file)->resize(min(1200,$width) , min(800,$height))->save($logoUrl);  
        return $logoUrl;
    }


    public static function _sliderImage($file)
    {
        $data = getimagesize($file);
        $width = $data[0];
        $height = $data[1];

        $logoName = date("Y_m_d_H_i_s_u").'-'.str_random(20);
        $logoExtension = $file->getClientOriginalExtension();
        $name = $file->getClientOriginalName();

        if($logoExtension=='pdf' || $logoExtension=='doc' || $logoExtension=='docx' ){

            $directory = 'public/uploads/cv/'.date('Y_m_d').'/';
            if(!file_exists ($directory))
            mkdir($directory);
            move_uploaded_file($file, "$directory$logoName.$logoExtension");
            return $directory.($logoName.'.'.$logoExtension);
        }

        $directory = 'public/uploads/slider_image/';
        if(!file_exists ($directory))
            mkdir($directory);
        $logoUrl = $directory.($name);
        Image::make($file)->resize(min(1200,$width) , min(800,$height))->save($logoUrl);  
        return $logoUrl;
    }

    public static function _bannerImage($file)
    {
        $data = getimagesize($file);
        $width = $data[0];
        $height = $data[1];

        $logoName = date("Y_m_d_H_i_s_u").'-'.str_random(20);
        $logoExtension = $file->getClientOriginalExtension();
        $name = $file->getClientOriginalName();

        if($logoExtension=='pdf' || $logoExtension=='doc' || $logoExtension=='docx' ){

            $directory = 'public/uploads/cv/'.date('Y_m_d').'/';
            if(!file_exists ($directory))
            mkdir($directory);
            move_uploaded_file($file, "$directory$logoName.$logoExtension");
            return $directory.($logoName.'.'.$logoExtension);
        }

        $directory = 'public/uploads/banner_image/';
        if(!file_exists ($directory))
            mkdir($directory);
        $logoUrl = $directory.($name);
        Image::make($file)->resize(min(1200,$width) , min(800,$height))->save($logoUrl);  
        return $logoUrl;
    }

    public static function _blogImage($file)
    {
        $data = getimagesize($file);
        $width = $data[0];
        $height = $data[1];

        $logoName = date("Y_m_d_H_i_s_u").'-'.str_random(20);
        $logoExtension = $file->getClientOriginalExtension();
        $name = $file->getClientOriginalName();

        if($logoExtension=='pdf' || $logoExtension=='doc' || $logoExtension=='docx' ){

            $directory = 'public/uploads/cv/'.date('Y_m_d').'/';
            if(!file_exists ($directory))
            mkdir($directory);
            move_uploaded_file($file, "$directory$logoName.$logoExtension");
            return $directory.($logoName.'.'.$logoExtension);
        }

        $directory = 'public/uploads/blog_image/';
        if(!file_exists ($directory))
            mkdir($directory);
        $logoUrl = $directory.($name);
        Image::make($file)->resize(min(1200,$width) , min(800,$height))->save($logoUrl);  
        return $logoUrl;
    }

    public static function _vendorImage($file)
    {
        $data = getimagesize($file);
        $width = $data[0];
        $height = $data[1];

        $logoName = date("Y_m_d_H_i_s_u").'-'.str_random(20);
        $logoExtension = $file->getClientOriginalExtension();

        if($logoExtension=='pdf' || $logoExtension=='doc' || $logoExtension=='docx' ){

            $directory = 'public/uploads/cv/'.date('Y_m_d').'/';
            if(!file_exists ($directory))
            mkdir($directory);
            move_uploaded_file($file, "$directory$logoName.$logoExtension");
            return $directory.($logoName.'.'.$logoExtension);
        }

        $directory = 'public/uploads/vendor/';
        if(!file_exists ($directory))
            mkdir($directory);
        $logoUrl = $directory.($logoName.'.'.$logoExtension);
        Image::make($file)->resize(min(1200,$width) , min(800,$height))->save($logoUrl);  
        return $logoUrl;
    }

    /**
     * Upload file to the specified location. Later it will upload by date.
     * @return file url.
     */
    public static function _writeFile($content)
    {

        /*$fileName = date("Y_m_d_H_i_s_u").'-'.str_random(20).'.txt';
        $directory = 'public/uploads/flies/'.date('Y_m_d').'/';         

        if(!file_exists ($directory))
            mkdir($directory);
            // File::makeDirectory(public_path().'/'.$directory,0777,true);

        $fileUrl = $directory.$fileName;      

        $file = fopen($fileUrl, "w") or die("Unable to open file!");
        fwrite($file, $content);
        fclose($file);

        return $fileUrl;*/
    }

    /**
     * Upload file to the specified location. Later it will upload by date.
     * @return file url.
     */
    public static function _writeNammedFile($content, $address)
    {   
        $fileName = $address;
        $directory = 'public/uploads/';         

        if(!file_exists ($directory))
            File::makeDirectory(public_path().'/'.$directory,0777,true);
        $fileUrl = $directory.$fileName;      

        $file = fopen($fileUrl, "w") or die("Unable to open file!");
        fwrite($file, $content);
        fclose($file);
        return true;
    }

    /**
     * Read file data form the address given.
     * @param the file address to read.
     * @return the contents.
     */
    public static function _readFile($address){
        /*$file = fopen( asset('/').$address, "r") or die("Unable to open file!");
        $content = fgets($file);
        fclose($file);
        return $content;*/
    }

    /*function strReplace($slug){
        return str_slug('%', '-', $slug));
    }*/

    /**
     * Read file data form the address given.
     * @param the file address to read.
     * @return the length.
     */
    public static function _count($address){
        $file = fopen( asset('/').$address, "r") or die("Unable to open file!");
        $content = fgets($file);
        fclose($file);
        return strlen($content);
    }
    public static function _brandLogo($file)
    {
        $data = getimagesize($file);
        $width = $data[0];
        $height = $data[1];
        $name = $file->getClientOriginalName();
        $directory = 'public/uploads/brand_image/';
        if(!file_exists ($directory))
            mkdir($directory);
        $logoUrl = $directory.($name);
        Image::make($file)->resize(min(1200,$width) , min(800,$height))->save($logoUrl);  
        return $logoUrl;
    }
    public static function _brandCoverImage($file)
    {
        $data = getimagesize($file);
        $width = $data[0];
        $height = $data[1];
        $name = $file->getClientOriginalName();
        $directory = 'public/uploads/brand_image/brandCoverImage/';
        if(!file_exists ($directory))
            mkdir($directory);
        $logoUrl = $directory.($name);
        Image::make($file)->resize(min(1200,$width) , min(800,$height))->save($logoUrl);  
        return $logoUrl;
    }
}
