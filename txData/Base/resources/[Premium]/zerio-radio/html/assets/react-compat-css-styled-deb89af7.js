import{s as y}from"./css-styled-798509d7.js";import{c as h,C as v,v as _}from"./react-simple-compat-7a65e6b5.js";import{r as d}from"./framework-utils-6dbb37c6.js";/*! *****************************************************************************
Copyright (c) Microsoft Corporation. All rights reserved.
Licensed under the Apache License, Version 2.0 (the "License"); you may not use
this file except in compliance with the License. You may obtain a copy of the
License at http://www.apache.org/licenses/LICENSE-2.0

THIS CODE IS PROVIDED ON AN *AS IS* BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
KIND, EITHER EXPRESS OR IMPLIED, INCLUDING WITHOUT LIMITATION ANY IMPLIED
WARRANTIES OR CONDITIONS OF TITLE, FITNESS FOR A PARTICULAR PURPOSE,
MERCHANTABLITY OR NON-INFRINGEMENT.

See the Apache Version 2.0 License for specific language governing permissions
and limitations under the License.
***************************************************************************** */var i=function(e,r){return i=Object.setPrototypeOf||{__proto__:[]}instanceof Array&&function(n,t){n.__proto__=t}||function(n,t){for(var o in t)t.hasOwnProperty(o)&&(n[o]=t[o])},i(e,r)};function p(e,r){i(e,r);function n(){this.constructor=e}e.prototype=r===null?Object.create(r):(n.prototype=r.prototype,new n)}var s=function(){return s=Object.assign||function(r){for(var n,t=1,o=arguments.length;t<o;t++){n=arguments[t];for(var a in n)Object.prototype.hasOwnProperty.call(n,a)&&(r[a]=n[a])}return r},s.apply(this,arguments)};function g(e,r){var n={};for(var t in e)Object.prototype.hasOwnProperty.call(e,t)&&r.indexOf(t)<0&&(n[t]=e[t]);if(e!=null&&typeof Object.getOwnPropertySymbols=="function")for(var o=0,t=Object.getOwnPropertySymbols(e);o<t.length;o++)r.indexOf(t[o])<0&&Object.prototype.propertyIsEnumerable.call(e,t[o])&&(n[t[o]]=e[t[o]]);return n}var j=function(e){p(r,e);function r(){var t=e!==null&&e.apply(this,arguments)||this;return t.injectResult=null,t.tag="div",t}var n=r.prototype;return n.render=function(){var t=this.props,o=t.className,a=o===void 0?"":o;t.cspNonce;var c=t.portalContainer,f=g(t,["className","cspNonce","portalContainer"]),l=this.injector.className,m=this.tag,u={};return _.indexOf("simple")>-1&&c&&(u={portalContainer:c}),h(m,s({ref:d(this,"element"),"data-styled-id":l,className:a+" "+l},u,f))},n.componentDidMount=function(){this.injectResult=this.injector.inject(this.element,{nonce:this.props.cspNonce})},n.componentWillUnmount=function(){this.injectResult.destroy(),this.injectResult=null},n.getElement=function(){return this.element},r}(v);function w(e,r){var n=y(r);return function(t){p(o,t);function o(){var a=t!==null&&t.apply(this,arguments)||this;return a.injector=n,a.tag=e,a}return o}(j)}export{w as s};
