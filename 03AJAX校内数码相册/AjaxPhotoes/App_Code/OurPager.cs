using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ServerControl
{
    [DefaultProperty("RecordCount")]
    [ToolboxData("<{0}:OurPager runat=server></{0}:OurPager>")]
    public class OurPager : CompositeControl, IPostBackEventHandler
    {
        Label _lblRecordCount;
        Label _lblPageSize;
        Label _lblPage;
        LinkButton _btnFirst;
        LinkButton _btnPrior;
        LinkButton _btnNext;
        LinkButton _btnLast;
        LinkButton _btnGo;
        TextBox _txtToPage;
        List<LinkButton> lbtnList;
        LinkButton _lbtnBack;
        LinkButton _lbtnFront;

        /// <summary>
        /// 页数
        /// </summary>
        private int PageCount
        {
            get
            {
                //由于Asp.net控件是无状态的,所以属性用ViewState保存状态
                if (ViewState["PageCount"] == null)
                {
                    return 0;
                }
                return (int)ViewState["PageCount"];
            }
            set
            {
                ViewState["PageCount"] = value;
                CalculateNumericPageCount(value, NumericButtonCount);
            }
        }

        [Category("Behavior")]
        [DefaultValue(0)]
        [Description("数据源记录数")]
        [TypeConverter(typeof(Int32Converter))]
        public int RecordCount
        {
            get
            {
                if (ViewState["RecordCount"] == null)
                {
                    return 0;
                }
                return (int)ViewState["RecordCount"];
            }
            set
            {
                if (ViewState["RecordCount"] != null && Convert.ToInt32(ViewState["RecordCount"]) != value)
                {
                    CurrentPageIndex = 1;//??
                }
                ViewState["RecordCount"] = value;
                CalculatePageCount(value, PageSize);
            }
        }

        [Category("Behavior")]
        [DefaultValue(10)]
        [Description("页尺寸/每页记录数")]
        [TypeConverter(typeof(Int32Converter))]
        public int PageSize
        {
            get
            {
                if (ViewState["PageSize"] == null)
                {
                    return 10;
                }
                return (int)ViewState["PageSize"];
            }
            set
            {
                ViewState["PageSize"] = value;
                CalculatePageCount(RecordCount, value);
            }
        }

        [Category("Behavior")]
        [DefaultValue(1)]
        [Description("当前页索引")]
        [TypeConverter(typeof(Int32Converter))]
        public int CurrentPageIndex
        {
            get
            {
                if (ViewState["CurrentPageIndex"] == null)
                {
                    return 1;
                }
                else
                {
                    return (int)ViewState["CurrentPageIndex"];
                }
            }
            set
            {
                if (value < 1 || value > PageCount) { }//其他属性会修正此异常
                if (ViewState["CurrentPageIndex"] == null || Convert.ToInt32(ViewState["CurrentPageIndex"]) != value)
                {
                    ViewState["CurrentPageIndex"] = value;
                    //根据当前页索引 和 每页页码按钮数 计算 页码按钮 页索引
                    int numPagIdx = value / NumericButtonCount;
                    if (value % NumericButtonCount > 0) //如果当前页索引和每页页码按钮数求除大于0
                    {
                        numPagIdx++;    //页码按钮页索引加1
                    }
                    NumericPageIndex = numPagIdx;   //设置页码按钮页索引
                    RecreateChildControls();    //重新创建子控件
                } 
            }
        }

        #region 外观属性

        [Category("Appearance")]
        [DefaultValue(true)]
        [Description("是否显示记录信息")]
        [TypeConverter(typeof(BooleanConverter))]
        public bool IsShowRecord
        {
            get
            {
                if (ViewState["IsShowRecord"] == null)
                {
                    return true;
                }
                return (bool)ViewState["IsShowRecord"];
            }
            set
            {
                ViewState["IsShowRecord"] = value;
            }
        }

        [Category("Appearance")]
        [DefaultValue(true)]
        [Description("是否显示页信息")]
        [TypeConverter(typeof(BooleanConverter))]
        public bool IsShowPage
        {
            get
            {
                if (ViewState["IsShowPage"] == null)
                {
                    return true;
                }
                return (bool)ViewState["IsShowPage"];
            }
            set
            {
                ViewState["IsShowPage"] = value;
            }
        }

        [Category("Appearance")]
        [DefaultValue(true)]
        [Description("是否显示页码按钮信息")]
        [TypeConverter(typeof(BooleanConverter))]
        public bool IsShowNumButton
        {
            get
            {
                if (ViewState["IsShowNumButton"] == null)
                {
                    return true;
                }
                return (bool)ViewState["IsShowNumButton"];
            }
            set
            {
                ViewState["IsShowNumButton"] = value;
            }
        }

        [Category("Appearance")]
        [DefaultValue(true)]
        [Description("是否显示GO按钮信息")]
        [TypeConverter(typeof(BooleanConverter))]
        public bool IsShowGoButton
        {
            get
            {
                if (ViewState["IsShowGoButton"] == null)
                {
                    return true;
                }
                return (bool)ViewState["IsShowGoButton"];
            }
            set
            {
                ViewState["IsShowGoButton"] = value;
            }
        }

        #endregion

        #region 页码按钮相关属性

        /// <summary>
        /// 页码按钮页数
        /// </summary>
        private int NumericPageCount
        {
            get
            {
                if (ViewState["NumericPageCount"] == null)
                {
                    return 0;
                }
                return (int)ViewState["NumericPageCount"];
            }
            set
            {
                ViewState["NumericPageCount"] = value;
            }
        }

        /// <summary>
        /// 每页页码按钮数
        /// </summary>
        [Category("Behavior")]
        [DefaultValue(10)]
        [Description("每页页码按钮数")]
        [TypeConverter(typeof(Int32Converter))]
        public int NumericButtonCount
        {
            get
            {
                if (ViewState["NumericButtonCount"] == null)
                {
                    return 10;
                }
                return (int)ViewState["NumericButtonCount"];
            }
            set
            {
                ViewState["NumericButtonCount"] = value;
                //当每页页码按钮数改变时计算分页页数和页码按钮的页数
                CalculatePageCount(RecordCount, PageSize);//??
                CalculateNumericPageCount(PageCount, value);
            }
        }

        /// <summary>
        /// 页码按钮当前页
        /// </summary>
        private int NumericPageIndex
        {
            get
            {
                if (ViewState["NumericPageIndex"] == null)
                {
                    return 1;
                }
                else
                {
                    return (int)ViewState["NumericPageIndex"];
                }
            }
            set
            {
                if (value < 1 || value > NumericPageCount)
                {
                    throw new Exception("页码按钮显示页码超界!");
                }
                ViewState["NumericPageIndex"] = value;
            }
        }

        #endregion

        #region Render

        /// <summary>
        /// 重定父类的创建子控件方法
        /// </summary>
        protected override void CreateChildControls()
        {
            int recCnt = RecordCount;
            int curPageIdx = CurrentPageIndex;
            int pageCnt = PageCount;
            int pagSiz = PageSize;

            Controls.Clear();   //清空子控件
            if (IsShowRecord)   //是否显示记录数部分
            {
                //创建显示记录数控件
                _lblRecordCount = new Label { Text = string.Format("共{0}条", recCnt) };
                //创建显示页尺寸控件
                _lblPageSize = new Label { Text = string.Format("每页{0}条", pagSiz) };
                //将子控件添加到分页控件
                Controls.Add(_lblRecordCount);
                Controls.Add(_lblPageSize);
            }
            if (IsShowPage) //是否显示页信息部分
            {
                _lblPage = new Label { Text = string.Format("第{0}页 / 共{1}页", curPageIdx, pageCnt) };
                Controls.Add(_lblPage);
            }
            _btnFirst = new LinkButton  //创建首页按钮,指定期命令名称
            {
                Text = "首页",
                CommandName = ((int)PageChangedType.atFirst).ToString(),
                CommandArgument = ""
            };
            _btnPrior = new LinkButton  //创建上页按钮,指定期命令名称
            {
                Text = "上页",
                CommandName = ((int)PageChangedType.atPrior).ToString(),
                CommandArgument = ""
            };
            _btnNext = new LinkButton   //创建下页按钮,指定期命令名称
            {
                Text = "下页",
                CommandName = ((int)PageChangedType.atNext).ToString(),
                CommandArgument = ""
            };
            _btnLast = new LinkButton   //创建末页按钮,指定期命令名称
            {
                Text = "末页",
                CommandName = ((int)PageChangedType.atLast).ToString(),
                CommandArgument = ""
            };
            if (IsShowGoButton) //是否显示页导航部分
            {
                _txtToPage = new TextBox    //创建页导航输入框    
                {
                    Text = curPageIdx.ToString(),
                    Width = 30,
                };
                //_txtToPage.TextChanged += _txtToPage_TextChanged;
                _btnGo = new LinkButton //创建页导航按钮,指定期命令名称
                {
                    Text = "Go",
                    CommandName = ((int)PageChangedType.atGo).ToString(),
                    CommandArgument = ""
                };
                Controls.Add(_txtToPage);
                Controls.Add(_btnGo);
            }
            //页码控件
            if (IsShowNumButton)    //是否显示页码按钮
            {
                lbtnList = new List<LinkButton>();  //创建页码按钮列表
                int numBtnCnt = NumericButtonCount;
                int modNum = (curPageIdx) % numBtnCnt;
                int startNum;
                if (modNum > 0) //当前页索引余页码按钮页尺寸大于0
                {
                    startNum = (curPageIdx) - modNum + 1;   //计算页码按钮当前页的开始页码
                }
                else//0
                {
                    startNum = (curPageIdx) - 9;
                }
                if (startNum <= pageCnt)
                {
                    int endNum = startNum + numBtnCnt - 1;  //计算页码按钮的
                    endNum = endNum > pageCnt ? pageCnt : endNum;   //计算页码按钮当前页的结束页码
                    //根据开始页码和结束页码创建当前页的所有页码按钮
                    for (int i = startNum; i <= endNum; i++)
                    {
                        LinkButton lbtn = new LinkButton();
                        lbtn.Text = i.ToString();
                        lbtn.CommandArgument = i.ToString();    //指定页码按钮的命令参数
                        //指定页码按钮的命令名称
                        lbtn.CommandName = ((int)PageChangedType.atNumeric).ToString();
                        lbtnList.Add(lbtn); //将页码按钮添加到页码按钮列表中
                        Controls.Add(lbtn);
                    }
                }
                _lbtnBack = new LinkButton  //创建向后翻页码按钮
                {
                    Text = "...",
                    CommandName = ((int)PageChangedType.atNumeric).ToString(),
                    CommandArgument = "back"
                };
                _lbtnFront = new LinkButton //创建向前翻页码按钮
                {
                    Text = "...",
                    CommandName = ((int)PageChangedType.atNumeric).ToString(),
                    CommandArgument = "front"
                };
                Controls.Add(_lbtnBack);
                Controls.Add(_lbtnFront);
            }
            Controls.Add(_btnFirst);//将首页按钮添加到分页控件
            Controls.Add(_btnPrior);
            Controls.Add(_btnNext);
            Controls.Add(_btnLast);
            ChildControlsCreated = true;    //设置子控件已创建
            CalculateButtonEnable();    //计算分页按钮可见
            CalculateNumericBtnVisible();   //计算页码翻页按钮...可见
        }

        /// <summary>
        /// 设置分页按钮的标记是Table
        /// </summary>
        protected override HtmlTextWriterTag TagKey
        {
            get
            {
                return HtmlTextWriterTag.Table;
            }
        }

        /// <summary>
        /// 重写父类中的呈现内容方法
        /// </summary>
        /// <param name="writer"></param>
        protected override void RenderContents(HtmlTextWriter writer)
        {
            EnsureChildControls();  //确认子控件是否被创建
            writer.RenderBeginTag(HtmlTextWriterTag.Tr);    //写行的开始标记
            if (IsShowRecord)   //是否呈现记录信息部分
            {
                writer.RenderBeginTag(HtmlTextWriterTag.Td);    //写单元格的开始标记
                _lblRecordCount.RenderControl(writer);  //呈现记录数子控件
                writer.RenderEndTag();  //写单元格的结束标记

                writer.RenderBeginTag(HtmlTextWriterTag.Td);
                _lblPageSize.RenderControl(writer);
                writer.RenderEndTag();
            }
            if (IsShowPage) //是否呈现页信息部分
            {
                writer.RenderBeginTag(HtmlTextWriterTag.Td);
                _lblPage.RenderControl(writer);
                writer.RenderEndTag();
            }
            writer.RenderBeginTag(HtmlTextWriterTag.Td);
            _btnFirst.RenderControl(writer);
            writer.RenderEndTag();

            writer.RenderBeginTag(HtmlTextWriterTag.Td);
            _btnPrior.RenderControl(writer);
            writer.RenderEndTag();

            if (IsShowNumButton)    //是否呈现页码按钮部分
            {
                writer.RenderBeginTag(HtmlTextWriterTag.Td);
                _lbtnBack.RenderControl(writer);
                writer.RenderEndTag();

                foreach (LinkButton lbtn in lbtnList)   //循环页码按钮列表依次呈现页码按钮
                {
                    writer.RenderBeginTag(HtmlTextWriterTag.Td);
                    lbtn.RenderControl(writer);
                    writer.RenderEndTag();
                }

                writer.RenderBeginTag(HtmlTextWriterTag.Td);
                _lbtnFront.RenderControl(writer);
                writer.RenderEndTag();
            }
            writer.RenderBeginTag(HtmlTextWriterTag.Td);
            _btnNext.RenderControl(writer);
            writer.RenderEndTag();

            writer.RenderBeginTag(HtmlTextWriterTag.Td);
            _btnLast.RenderControl(writer);
            writer.RenderEndTag();
            if (IsShowGoButton) //是否呈现页导航部分
            {
                writer.RenderBeginTag(HtmlTextWriterTag.Td);
                _txtToPage.RenderControl(writer);
                writer.RenderEndTag();

                writer.RenderBeginTag(HtmlTextWriterTag.Td);
                _btnGo.RenderControl(writer);
                writer.RenderEndTag();
            }
            writer.RenderEndTag();  //写行的结束标记

        }

        #endregion

        #region Event

        [Category("Action")]
        public event PageChangedHandler PageChanged;

        #region IPostBackEventHandler 成员

        public void RaisePostBackEvent(string eventArgument)
        {
        }

        #endregion

        /// <summary>
        /// 当触发分页控件事件时执行的过程
        /// </summary>
        /// <param name="ty"></param>
        /// <param name="cmdArgs"></param>
        private void DoPageChanged(PageChangedType ty, string cmdArgs)
        {
            int currentPageIdx = CurrentPageIndex;
            int pageCnt = PageCount;

            int NewPageIndex = CurrentPageIndex;    //设置新页索引
            switch (ty)
            {
                case PageChangedType.atFirst:   //如果触发首页按钮事件
                    NewPageIndex = 1;   //新页索引设为1
                    break;
                case PageChangedType.atPrior:   //如果触发上页按钮事件
                    if (currentPageIdx > 1)
                    {
                        NewPageIndex = CurrentPageIndex - 1;    //新页索引设为当前页索引减1
                    }
                    break;
                case PageChangedType.atNext:    //如果触发下页按钮事件
                    if (currentPageIdx < pageCnt)
                    {
                        NewPageIndex = CurrentPageIndex + 1;    //新页索引设为当前页索引加1
                    }
                    break;
                case PageChangedType.atLast:    //如果触发末页按钮事件    
                    NewPageIndex = pageCnt;
                    break;
                case PageChangedType.atGo:  //如果触发页导航按钮事件
                    int idx = currentPageIdx;
                    if (int.TryParse(_txtToPage.Text, out idx))
                    {
                        if (idx >= 1 && idx <= pageCnt)
                        {
                            NewPageIndex = idx; //新页索引等于导航输入框数字
                        }
                    }
                    break;
                case PageChangedType.atNumeric: //如果触发页码按钮事件
                    if (cmdArgs == "back")  //如果触发向后翻页码按钮事件
                    {
                        if (NumericPageIndex > 1)
                        {
                            NumericPageIndex--;    //页码按钮页索引减1
                            //根据页码按钮索引设置页索引
                            NewPageIndex = NumericPageIndex * NumericButtonCount;
                        }
                    }
                    else if (cmdArgs == "front")    //如果触发向前翻页码按钮事件
                    {
                        if (NumericPageIndex < NumericPageCount)
                        {
                            NumericPageIndex++; //页码按钮页索引加1 
                            //根据页码按钮索引设置页索引
                            NewPageIndex = (NumericPageIndex - 1) * NumericButtonCount + 1;
                        }
                    }
                    else  //如果触发页码按钮事件
                    {
                        int tmpArgs = Convert.ToInt32(cmdArgs);
                        if (tmpArgs >= 1 && tmpArgs <= RecordCount)
                        {
                            NewPageIndex = tmpArgs; //设置页索引为页码按钮参数
                        }
                    }
                    break;
            }

            if (PageChanged != null)    //加页改变事件不为空
            {
                PageArgs args = new PageArgs(NewPageIndex); //设置页改变事件参数
                PageChanged(this, args);    //执行页改变事件代码
            }

            CurrentPageIndex = NewPageIndex;    //最终确认当前页索引
            CalculateButtonEnable();    //计算按钮只读
            CalculateNumericBtnVisible();   //计算页码按钮可见
            if (_lblPage != null)
                _lblPage.Text = string.Format("第{0}页 / 共{1}页", NewPageIndex, pageCnt);
            if (_txtToPage != null)
                _txtToPage.Text = NewPageIndex.ToString();
            //如果是向前或向后翻页码事件则要重新创建子控件
            if (ty == PageChangedType.atNumeric && (cmdArgs == "back" || cmdArgs == "front"))
            {
                RecreateChildControls();
            }
        }

        /// <summary>
        /// 子控件_txtToPage文本改变事件
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void _txtToPage_TextChanged(object sender, EventArgs e)
        {
            DoPageChanged(PageChangedType.atGo, "");
        }

        /// <summary>
        /// 重写父类的事件冒泡方法，当触发任何子控件的事件时都会执行此方法
        /// </summary>
        /// <param name="source"></param>
        /// <param name="args"></param>
        /// <returns></returns>
        protected override bool OnBubbleEvent(object source, EventArgs args)
        {
            if (args is CommandEventArgs)
            {
                PageChangedType cmdName = (PageChangedType)Convert.ToInt32((args as CommandEventArgs).CommandName);
                string cmdArg = (args as CommandEventArgs).CommandArgument.ToString();
                DoPageChanged(cmdName, cmdArg); //执行处理自定义分页的过程
                return true;
            }
            else
            {
                return base.OnBubbleEvent(source, args);    //执行父类的冒泡方法
            }
        }

        #endregion

        #region Custom

        /// <summary>
        /// 设置分页按钮只读
        /// </summary>
        /// <param name="first"></param>
        /// <param name="prior"></param>
        /// <param name="next"></param>
        /// <param name="last"></param>
        private void SetButtonEnable(bool first, bool prior, bool next, bool last)
        {
            if (_btnFirst != null)
                _btnFirst.Enabled = first;
            if (_btnPrior != null)
                _btnPrior.Enabled = prior;
            if (_btnNext != null)
                _btnNext.Enabled = next;
            if (_btnLast != null)
                _btnLast.Enabled = last;
        }

        /// <summary>
        /// 根据记录数和页尺寸计算总页数
        /// </summary>
        /// <param name="recordCount"></param>
        /// <param name="pageSize"></param>
        private void CalculatePageCount(int recordCount, int pageSize)
        {
            if (pageSize == 0)
            {
                return;
            }
            int pagCnt = 0;
            pagCnt = recordCount / pageSize;
            if (recordCount % pageSize > 0)
            {
                pagCnt++;
            }
            PageCount = pagCnt;
            RecreateChildControls();
        }

        /// <summary>
        /// 根据页数和每页页码按钮数计算页码按钮页数
        /// </summary>
        /// <param name="recordCount"></param>
        /// <param name="pageSize"></param>
        private void CalculateNumericPageCount(int pageCount, int numBtnCnt)
        {
            if (pageCount == 0 || numBtnCnt == 0)
            {
                return;
            }
            int numPagCnt = 0;
            numPagCnt = pageCount / numBtnCnt;
            if (pageCount % numBtnCnt > 0)
            {
                numPagCnt++;
            }
            if (NumericPageCount != numPagCnt)
            {
                NumericPageCount = numPagCnt;
                //NumericPageIndex = 1;//??
            }
        }

        /// <summary>
        /// 计算按钮可见
        /// </summary>
        private void CalculateButtonEnable()
        {
            if (_btnGo != null)
                _btnGo.Visible = true;
            if (_txtToPage != null)
                _txtToPage.Visible = true;

            int currentPageIdx = CurrentPageIndex;
            int pageCnt = PageCount;

            if (pageCnt < 2)    //如果总页数等于1
            {
                SetButtonEnable(false, false, false, false);
                if (_btnGo != null)
                    _btnGo.Visible = false;
                if (_txtToPage != null)
                    _txtToPage.Visible = false;
            }
            else if (currentPageIdx == pageCnt) //如果是末页
            {
                SetButtonEnable(true, true, false, false);
            }
            else if (currentPageIdx < 2)    //如果是首页
            {
                SetButtonEnable(false, false, true, true);
            }
            else  //否则首末上下四个按钮都显示
            {
                SetButtonEnable(true, true, true, true);
            }
        }

        /// <summary>
        /// 计算页码...按钮可见
        /// </summary>
        private void CalculateNumericBtnVisible()
        {
            int numPageIdx = NumericPageIndex;
            int numPagCnt = NumericPageCount;

            if (numPagCnt < 2)  //如果总页数等于1
            {
                _lbtnBack.Visible = false;
                _lbtnFront.Visible = false;
            }
            else if (numPageIdx == numPagCnt)   //如果是末页
            {
                _lbtnBack.Visible = true;
                _lbtnFront.Visible = false;
            }
            else if (numPageIdx < 2)    //如果是首页
            {
                _lbtnBack.Visible = false;
                _lbtnFront.Visible = true;
            }
            else  //否则向前向后翻页码按钮都显示
            {
                _lbtnBack.Visible = true;
                _lbtnFront.Visible = true;
            }

        }

        #endregion
    }

    /// <summary>
    /// 页改变事件委托
    /// </summary>
    /// <param name="sender"></param>
    /// <param name="e"></param>
    public delegate void PageChangedHandler(object sender, PageArgs e);

    /// <summary>
    /// 页改变类型枚举
    /// </summary>
    public enum PageChangedType : int
    {
        atFirst = 0,
        atPrior = 1,
        atNext = 2,
        atLast = 3,
        atGo = 4,
        atNumeric = 5
    }

    /// <summary>
    /// 页改变事件参数
    /// </summary>
    public class PageArgs : EventArgs
    {
        public int NewPageIndex { get; set; }

        public PageArgs(int newPageIndex)
        {
            NewPageIndex = newPageIndex;
        }
    }

}
