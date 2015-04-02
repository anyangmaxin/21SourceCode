using System;
using System.Data;
using OnLineExam.DataBaseClass;

namespace OnLineExam.CommonClass
{
    /// <summary>
    /// 一个通用的树状菜单类
    /// </summary>
    public class Tree
    {
        private string _treeHtml;
        private DataTable _dataTable;

        /// <summary>
        /// 根据DataTable对象，生成一棵树
        /// </summary>
        /// <param name="dataTable">树中节点的数据</param>
        /// <returns>树的HTML代码</returns>
        public string CreateTree(DataTable dataTable)
        {
            this._dataTable = dataTable;
            this.CreateSubTree(0);
            return _treeHtml;
        }

        /// <summary>
        /// 获取父节点编号为parentId的所有节点，并用DataTable返回
        /// </summary>
        /// <param name="parentId">父节点编号</param>
        /// <returns>DataTable形式的所有孩子节点数据</returns>
        private DataTable GetChilds(int parentId)
        {
            DataTable childNodes = new DataTable();
            childNodes = this._dataTable.Clone();

            foreach (DataRow dr in this._dataTable.Rows)
            {
                if (Convert.ToInt32(dr["ParentId"]) == parentId)
                {
                    childNodes.ImportRow(dr);
                }
            }

            return childNodes;
        }

        /// <summary>
        /// 判断编号为nodeId的节点是否为叶子节点
        /// </summary>
        /// <param name="nodeId">待判断的节点编号</param>
        /// <returns>是叶子节点：返回true；否则：返回false</returns>
        private bool IsLeaf(int nodeId)
        {
            foreach (DataRow dr in this._dataTable.Rows)
                if (Convert.ToInt32(dr["ParentId"]) == nodeId)
                    return false;
            return true;
        }

        /// <summary>
        /// 得到编号为nodeId的节点的父节点编号
        /// </summary>
        /// <param name="nodeId">节点编号</param>
        /// <returns>父节点编号</returns>
        private int GetParent(int nodeId)
        {
            foreach (DataRow dr in this._dataTable.Rows)
                if (Convert.ToInt32(dr["NodeId"]) == nodeId)
                    return Convert.ToInt32(dr["ParentId"]);
            return -1;

        }

        /// <summary>
        /// 得到编号为nodeId的节点的级别，根节点为0
        /// </summary>
        /// <param name="nodeId">编号</param>
        /// <returns>节点的级别，根节点为0</returns>
        private int GetLevel(int nodeId)
        {
            int parentId = GetParent(nodeId);
            if (parentId == 0) return 1;
            else
                return GetLevel(parentId) + 1;	//递归
        }

        /// <summary>
        /// 递归生成根编号为nodeId的树
        /// </summary>
        /// <param name="nodeId">所要生成子树的根节点</param>
        private void CreateSubTree(int nodeId)
        {
            DataTable childNodes = this.GetChilds(nodeId);	//获取根节点的所有孩子

            //循环生成根节点的所有孩子对应的HTML
            int childId = 0;
            foreach (DataRow dr in childNodes.Rows)
            {
                childId = Convert.ToInt32(dr["nodeId"]);
                this._treeHtml += "<div id=div_" + childId.ToString() + ">";

                //根据该孩子的级别，生成一些空格，以体现层次结构
                for (int i = 0; i < GetLevel(childId); i++)
                    this._treeHtml += "&nbsp;&nbsp;&nbsp;&nbsp;";

                //如果该孩子是叶子节点，则生成其HTML代码
                if (this.IsLeaf(childId))
                {
                    this._treeHtml += "<img src='..\\Images\\folder.gif'/><a href=" + dr["Url"] + ">" + dr["Text"] + "</a></div>";
                }
                //如果该孩子为中间节点，则首先构造其HTML，然后递归生成其所有孩子的HTML
                else
                {
                    this._treeHtml += "<img src='..\\Images\\folderopen.gif'/><a href=" + dr["Url"] + ">" + dr["Text"] + "</a></div>";
                    this.CreateSubTree(childId);//递归
                }
            }
        }
    }
}