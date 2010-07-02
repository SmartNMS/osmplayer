﻿/**
 *  Copyright (c) 2010 Alethia Inc,
 *  http://www.alethia-inc.com
 *  Developed by Travis Tidwell | travist at alethia-inc.com 
 *
 *  License:  GPL version 3.
 *
 *  Permission is hereby granted, free of charge, to any person obtaining a copy
 *  of this software and associated documentation files (the "Software"), to deal
 *  in the Software without restriction, including without limitation the rights
 *  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
 *  copies of the Software, and to permit persons to whom the Software is
 *  furnished to do so, subject to the following conditions:
 *  
 *  The above copyright notice and this permission notice shall be included in
 *  all copies or substantial portions of the Software.

 *  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 *  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 *  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 *  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 *  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 *  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
 *  THE SOFTWARE.
 */
package com.mediafront.display.menu
{
   import com.mediafront.plugin.SkinablePlugin;
   import com.mediafront.utils.Settings;
   import com.mediafront.utils.MenuSettings;
   import com.mediafront.display.menu.MenuEvent;
   import com.mediafront.display.media.controls.ControlEvent;
   
   import flash.display.MovieClip;
   
   public class Menu extends SkinablePlugin
   {  
      public override function loadSettings( _settings:Settings ) : void
      {
         super.loadSettings( new MenuSettings( _settings ) );
         super.loadSkin( settings.menu );                
      }
      
      public override function setSkin( _skin:MovieClip ) : void
      {
         menuContent = _skin.menuContent;
         _skin.visible = menuVisible;
         super.setSkin( _skin );
      }     
      
      public override function initialize( comps:Object ) : void
      {
         super.initialize( comps );
         components.controlBar.addEventListener( ControlEvent.MENU, onMenuButton );
      }
      
      public function registerMenuItem( menuTitle:String, menuItem:* ) 
      {
         trace( menuItem.name );
         menuContent.addChild( menuItem.skin );
      }
      
      private function onMenuButton( event:* ) 
      {
         menuVisible = !menuVisible;
         skin.show( menuVisible );
      }
      
      public var menuContent:MovieClip;
      private var menuVisible:Boolean = false;
   }  
}
